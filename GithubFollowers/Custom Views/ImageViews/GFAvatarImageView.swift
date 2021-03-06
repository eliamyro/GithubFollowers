//
//  GFAvatarImageView.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 26/2/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    // MARK: - Properties
    
    let placeholderImage = Image.avatarPlaceholder!
    let cache = NetworkManager.shared.cache
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
    }
}
