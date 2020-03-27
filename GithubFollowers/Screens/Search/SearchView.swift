//
//  SearchView.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 4/3/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class SearchView: UIView {
    
    // MARK: - Properties
    
    private let LOGO_IMG = "gh-logo"
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: LOGO_IMG)
        
        return imageView
    }()
    
    lazy var usernameTextField = GFTextField()
    
    lazy var actionButton = GFButton(backgroundColor: .systemGreen, title: Text.getFollowers)
    
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
        backgroundColor = .systemBackground
        
        addViews()
        anchorViews()
    }
    
    private func addViews() {
        addSubview(logoImageView)
        addSubview(usernameTextField)
        addSubview(actionButton)
    }
    
    private func anchorViews() {
        logoImageView.anchor(top: safeAreaLayoutGuide.topAnchor, margin: .init(top: 80, left: 0, bottom: 0, right: 0), size: .init(width: 200, height: 200))
        logoImageView.centerX(inView: self)
        
        usernameTextField.anchor(top: logoImageView.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, margin: .init(top: 48, left: 50, bottom: 0, right: 50), size: .init(width: 0, height: 50))
        
        actionButton.anchor(leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor, margin: .init(top: 0, left: 50, bottom: 50, right: 50), size: .init(width: 0, height: 50))
    }
}
