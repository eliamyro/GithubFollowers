//
//  FavoritesListVC.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 22/2/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class FavoritesListVC: GFDataLoadingVC {
    
    // MARK: - Properties
    
    private var cView = FavoritesListView()
    
    var favorites = [Follower]()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = cView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getFavorites()
    }
    
    // MARK: Helpers
    
    private func configure() {
        navigationItem.title = Text.favorites
        navigationController?.navigationBar.prefersLargeTitles = true
        
        cView.tableView.delegate = self
        cView.tableView.dataSource = self
        cView.tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.reuseID)
    }
    
    private func getFavorites() {
        PersistenceManager.retrieveFavorites { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let favorites):
                if favorites.isEmpty {
                    self.showEmptyStateView(with: Text.noFavorites, in: self.cView)
                } else {
                    self.favorites = favorites
                    DispatchQueue.main.async {
                        self.cView.tableView.reloadData()
                        self.cView.bringSubviewToFront(self.cView.tableView)
                    }
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: Text.errorTitleDefault, message: error.rawValue, buttonTitle: Text.ok)
            }
        }
    }
}

// MARK: - Extensions

extension FavoritesListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.reuseID, for: indexPath) as! FavoriteCell
        cell.favorite = favorites[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite = favorites[indexPath.row]
        let followersListVC = FollowersListVC()
        followersListVC.username = favorite.login
        navigationController?.pushViewController(followersListVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        let favorite = favorites[indexPath.row]
        favorites.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
        
        PersistenceManager.updateWith(favorite: favorite, actionType: .remove) { [weak self] error in
            guard let self = self else { return }
            guard let error = error else { return }
            
            self.presentGFAlertOnMainThread(title: Text.errorTitleDefault, message: error.rawValue, buttonTitle: Text.ok)
        }
        
        if favorites.isEmpty {
            showEmptyStateView(with: Text.noFavorites, in: cView)
        }
    }
}
