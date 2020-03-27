//
//  GFFollowerItemVC.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 21/3/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class GFFollowerItemVC: GFInfoItemsVC {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureItems()
    }
    
    // MARK: - Helpers
    
    private func configureItems() {
        guard let user = user else { return }
        cView.infoItem1.set(itemInfoType: .followers, withCount: user.followers)
        cView.infoItem2.set(itemInfoType: .following, withCount: user.following)
        cView.actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    // MARK: Selectors
    
    override func actionButtonTapped() {
        guard let user = user else { return }
        delegate?.didTapGetFollowers(for: user)
    }
}
