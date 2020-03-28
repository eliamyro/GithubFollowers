//
//  FollowersListVCViewController.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 23/2/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

protocol FollowersListVCDelegate: class {
    func didRequestFollowers(for username: String)
}

class FollowersListVC: UIViewController {
    
    // MARK: - Properties
    
    enum Section { case main }
    
    lazy var addBarButton: UIBarButtonItem = {
        UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddButton))
    }()
    
    lazy var followersCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
        
        return collectionView
    }()
    
    lazy var dataSource: UICollectionViewDiffableDataSource<Section, Follower> = {
        let difDataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: followersCollectionView) { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as? FollowerCell
            cell?.follower = follower
            
            return cell
        }
        
        return difDataSource
    }()
    
    lazy var loadingView: GFLoadingView = {
        return GFLoadingView(frame: view.bounds)
    }()
    
    lazy var searchController: UISearchController = {
        let search = UISearchController()
        search.searchResultsUpdater = self
        search.searchBar.delegate = self
        search.searchBar.placeholder = "Search for a username"
        search.obscuresBackgroundDuringPresentation = false
        
        return search
    }()
    
    var username: String? {
        didSet {
            guard let username = self.username else { return }
            title = username
        }
    }
    
    var followers = [Follower]()
    var filteredFollowers = [Follower]()
    private var page = 1
    private var hasMoreFollowers = true
//    private var isSearching = false
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configure()
        getFollowers(username: username, page: page)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Helpers
    
    private func configure() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.rightBarButtonItem = addBarButton
    }
    
    private func getFollowers(username: String?, page: Int) {
        showLoadingView()
        
        if let username = username {
            NetworkManager.shared.getFollowers(for: username, page: page) { [weak self] result in
                guard let self = self else { return }
                self.dismissLoadingView()
                switch result {
                case .success(let followers):
                    if followers.count < 100 { self.hasMoreFollowers = false }
                    self.followers.append(contentsOf: followers)
                    if self.followers.isEmpty {
                        let message = "This user doesn't have any followers. Go follow him. 🙂"
                        DispatchQueue.main.async { self.showEmptyStateView(with: message, in: self.view) }
                        return
                    }
                    self.updateData(on: self.followers)
                    
                case .failure(let error):
                    self.presentGFAlertOnMainThread(title: Text.errorTitle, message: error.rawValue, buttonTitle: Text.ok)
                }
            }
        }
    }
    
    private func updateData(on followers: [Follower]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
    }
    
    // MARK: - Selectors
    
    @objc private func handleAddButton() {
        showLoadingView()
        guard let username = username else { return }
        
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            
            switch result {
            case .success(let user):
                let favorite = Follower(login: user.login, avatarUrl: user.avatarUrl)
                PersistenceManager.updateWith(favorite: favorite, actionType: .add) { error in
                    guard let error = error else {
                        self.presentGFAlertOnMainThread(title: Text.success, message: Text.favoritedSuccessful, buttonTitle: Text.ok)
                        return
                    }
                    
                    self.presentGFAlertOnMainThread(title: Text.errorTitleDefault, message: error.rawValue, buttonTitle: Text.ok)
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: Text.errorTitleDefault, message: error.rawValue, buttonTitle: Text.ok)
            }
        }
    }
}

// MARK: - Extensions

extension FollowersListVC: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.height
        
        if offsetY > (contentHeight - height) {
            guard hasMoreFollowers else { return }
            page += 1
            getFollowers(username: username, page: page)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activeList = filteredFollowers.isEmpty ? followers : filteredFollowers
        
        let destVC = UserInfoVC()
        destVC.follower = activeList[indexPath.item]
        destVC.delegate = self
        let navController = UINavigationController(rootViewController: destVC)
        present(navController, animated: true)
    }
}

extension FollowersListVC: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {
            filteredFollowers.removeAll()
            updateData(on: followers)
            return
        }
        
        filteredFollowers = followers.filter { follower -> Bool in
            follower.login.lowercased().contains(filter.lowercased())
        }
        
        updateData(on: filteredFollowers)
    }
}

extension FollowersListVC: FollowersListVCDelegate {
    func didRequestFollowers(for username: String) {
        self.username = username
        navigationItem.title = title
        page = 1
        followers.removeAll()
        filteredFollowers.removeAll()
        followersCollectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .top, animated: true)
        getFollowers(username: username, page: page)
    }
}


