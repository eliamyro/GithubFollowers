//
//  FollowerCell.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 26/2/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let reuseID = "FollowerCell"
    
    var follower: Follower? {
        didSet {
            guard let follower = follower else { return }
            usernameLabel.text = follower.login
            avatarImageView.getImage(from: follower.avatarUrl)
            
//            NetworkManager.shared.getImage(from: follower.avatarUrl) { [weak self] result in
//                guard let self = self else { return }
//
//                switch result {
//                case .success(let image):
//                    DispatchQueue.main.async {
//                        self.avatarImageView.image = image
//                    }
//                }
//            }
        }
    }
    
    lazy var avatarImageView = GFAvatarImageView(frame: .zero)
    lazy var usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
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
        addViews()
        anchorViews()
    }
    
    private func addViews() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
    }
    
    private func anchorViews() {
        let padding: CGFloat = 8
        
        avatarImageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, margin: .init(top: padding, left: padding, bottom: 0, right: padding))
        avatarImageView.anchorHW(height: avatarImageView.widthAnchor)
        
        usernameLabel.anchor(top: avatarImageView.bottomAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, margin: .init(top: 12, left: padding, bottom: 0, right: padding), size: .init(width: 0, height: 20))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = UIImage(named: "avatar-placeholder")
    }
}
