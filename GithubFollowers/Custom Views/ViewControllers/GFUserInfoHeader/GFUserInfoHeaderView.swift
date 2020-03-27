//
//  GFUserInfoHeaderView.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 7/3/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class GFUserInfoHeaderView: UIView {
    
    // MARK: - Properties
    
    lazy var avatarImageView = GFAvatarImageView(frame: .zero)
    lazy var usernameLabel = GFTitleLabel(textAlignment: .left, fontSize: 34)
    lazy var nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    
    lazy var locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: SFSymbols.location)
        imageView.tintColor = .secondaryLabel
        
        return imageView
    }()
    
    lazy var locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    
    lazy var bioLabel: GFBodyLabel = {
        let label = GFBodyLabel(textAlignment: .left)
        label.numberOfLines = 3
        
        return label
    }()
    
    private var padding: CGFloat = 20
    private var textImagePadding: CGFloat = 12
    
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
        addSubview(nameLabel)
        addSubview(locationImageView)
        addSubview(locationLabel)
        addSubview(bioLabel)
    }
    
    private func anchorViews() {
        avatarImageView.anchor(top: topAnchor, leading: leadingAnchor, margin: .init(top: padding, left: padding, bottom: 0, right: 0), size: .init(width: 90, height: 90))
        
        usernameLabel.anchor(top: avatarImageView.topAnchor, leading: avatarImageView.trailingAnchor, trailing: trailingAnchor, margin: .init(top: 0, left: textImagePadding, bottom: 0, right: 0), size: .init(width: 0, height: 38))
        
        nameLabel.anchor(leading: avatarImageView.trailingAnchor, trailing: trailingAnchor, margin: .init(top: 0, left: textImagePadding, bottom: 0, right: 0), size: .init(width: 0, height: 20))
        nameLabel.centerY(inView: avatarImageView, constant: 4)
        
        locationImageView.anchor(leading: avatarImageView.trailingAnchor, bottom: avatarImageView.bottomAnchor, margin: .init(top: 0, left: textImagePadding, bottom: 0, right: 0), size: .init(width: 20, height: 20))
        
        locationLabel.anchor(leading: locationImageView.trailingAnchor, trailing: trailingAnchor, margin: .init(top: 0, left: 5, bottom: 0, right: 0), size: .init(width: 0, height: 20))
        locationLabel.centerY(inView: locationImageView)
        
        bioLabel.anchor(top: avatarImageView.bottomAnchor, leading: avatarImageView.leadingAnchor, trailing: trailingAnchor, margin: .init(top: textImagePadding, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 60))

    }
}
