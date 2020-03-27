//
//  GFAlertUI.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 24/2/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class GFAlertView: UIView {
    
    // MARK: - Properties
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var titleLabel = GFTitleLabel(textAlignment: .center, fontSize: 20)
    
    lazy var messageLabel: GFBodyLabel = {
        let label = GFBodyLabel(textAlignment: .center)
        label.numberOfLines = 4
        
        return label
    }()
    
    lazy var actionButton = GFButton(backgroundColor: .systemPink, title: Text.ok)
    
    let padding: CGFloat = 20
    
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
        backgroundColor = UIColor.black.withAlphaComponent(0.75)
        
        addViews()
        anchorViews()
    }
    
    private func addViews() {
        addSubview(containerView)
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(actionButton)
        containerView.addSubview(messageLabel)
    }
    
    private func anchorViews() {
        containerView.center(inView: self)
        containerView.anchor(size: .init(width: 280, height: 220))
        
        titleLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, trailing: containerView.trailingAnchor, margin: .init(top: padding, left: padding, bottom: 0, right: padding), size: .init(width: 0, height: 28))
        
        actionButton.anchor(leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, margin: .init(top: 0, left: padding, bottom: padding, right: padding), size: .init(width: 0, height: 44))
        
        messageLabel.anchor(top: titleLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: actionButton.topAnchor, trailing: containerView.trailingAnchor, margin: .init(top: 8, left: padding, bottom: 8, right: padding))
    }
}
