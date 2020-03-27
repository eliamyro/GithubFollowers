//
//  FollowersListUI.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 26/2/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

extension FollowersListVC {
    
    func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    
        configureFollowersCollectionView()
    }
    
    private func configureFollowersCollectionView() {
        view.addSubview(followersCollectionView)
    }
    
    func showLoadingView() {
        view.addSubview(loadingView)
        loadingView.fadeIn()
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async { self.loadingView.removeFromSuperview() }
    }
}
