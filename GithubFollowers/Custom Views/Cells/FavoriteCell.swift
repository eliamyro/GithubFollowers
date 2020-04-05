//
//  FavoriteCell.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 28/3/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class FavoriteCell: UITableViewCell {

    // MARK: - Properties
    
    static let reuseID = "FavoriteCell"
    
    lazy var avatarImageView = GFAvatarImageView(frame: .zero)
    lazy var usernameLabel = GFTitleLabel(textAlignment: .natural, fontSize: 26)
    
    var favorite: Follower? {
        didSet {
            guard let favorite = favorite else { return }
            usernameLabel.text = favorite.login
            NetworkManager.shared.downloadImage(from: favorite.avatarUrl) { [weak self] image in
                guard let self = self else { return }
                DispatchQueue.main.async { self.avatarImageView.image = image }
            }
        }
    }
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        addViews()
        anchorViews()
        
        accessoryType = .disclosureIndicator
    }
    
    private func addViews() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
    }
    
    private func anchorViews() {
        let padding: CGFloat = 12
        
        avatarImageView.centerY(inView: self)
        avatarImageView.anchor(leading: leadingAnchor, margin: .init(top: 0, left: padding, bottom: 0, right: 0), size: .init(width: 60, height: 60))
        
        usernameLabel.centerY(inView: self)
        usernameLabel.anchor(leading: avatarImageView.trailingAnchor, trailing: trailingAnchor, margin: .init(top: 0, left: 2 * padding, bottom: 0, right: padding), size: .init(width: 0, height: 40))
    }
}
