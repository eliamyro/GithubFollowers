//
//  GFItemInfoView.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 18/3/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

enum ItemInfoType {
    case repos, gists, followers, following
}

class GFItemInfoView: UIView {
    
    // MARK: - Properties
    
    lazy var symbolImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .label
        
        return imageView
    }()
    
    lazy var titleLabel: GFTitleLabel = {
        let label = GFTitleLabel(textAlignment: .left, fontSize: 14)
        
        return label
    }()
    
    lazy var countLabel: GFTitleLabel = {
        let label = GFTitleLabel(textAlignment: .center, fontSize: 14)
        
        return label
    }()

    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
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
        addSubview(symbolImageView)
        addSubview(titleLabel)
        addSubview(countLabel)
        
    }
    
    private func anchorViews() {
        symbolImageView.anchor(top: topAnchor, leading: leadingAnchor, size: .init(width: 20, height: 20))
        
        titleLabel.centerY(inView: symbolImageView)
        titleLabel.anchor(leading: symbolImageView.trailingAnchor, trailing: trailingAnchor, margin: .init(top: 0, left: 12, bottom: 0, right: 0), size: .init(width: 0, height: 18))
        
        countLabel.anchor(top: symbolImageView.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, margin: .init(top: 4, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 18))
    }
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
        switch itemInfoType {
        case .repos:
            symbolImageView.image = UIImage(systemName: SFSymbols.repos)
            titleLabel.text = Text.publicRepos
        case .gists:
            symbolImageView.image = UIImage(systemName: SFSymbols.gists)
            titleLabel.text = Text.publicGists
        case .followers:
            symbolImageView.image = UIImage(systemName: SFSymbols.followers)
            titleLabel.text = Text.followers
        case .following:
            symbolImageView.image = UIImage(systemName: SFSymbols.following)
            titleLabel.text = Text.following
        }
        
        countLabel.text = String(count)
    }
}
