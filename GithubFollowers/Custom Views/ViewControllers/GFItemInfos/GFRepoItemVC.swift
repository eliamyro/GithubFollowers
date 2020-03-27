//
//  GFRepoItemVC.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 21/3/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class GFRepoItemVC: GFInfoItemsVC {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureItems()
    }
    
    // MARK: - Helpers
    
    private func configureItems() {
        guard let user = user else { return }
        cView.infoItem1.set(itemInfoType: ItemInfoType.repos, withCount: user.publicRepos)
        cView.infoItem2.set(itemInfoType: ItemInfoType.gists, withCount: user.publicGists)
        cView.actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
    
    // MARK: - Selectors
    
    override func actionButtonTapped() {
        guard let user = user else { return }
        delegate?.didTapGithubProfile(for: user)
    }
}
