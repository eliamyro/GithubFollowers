//
//  GFEmptyStateView.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 1/3/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class GFEmptyStateView: UIView {
    
    // MARK: - Properties
    
    private let LOGO_IMG = "empty-state-logo"
    
    lazy var messageLabel: GFTitleLabel = {
        let label = GFTitleLabel(textAlignment: .center, fontSize: 28)
        label.numberOfLines = 3
        label.textColor = .secondaryLabel
        label.text = "asdfaskj sdlfksdlkj sdlfkjsdjfklskdj sdjfskldfk"
        
        return label
    }()
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: LOGO_IMG)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        
    }
    
    convenience init(message: String) {
        self.init(frame: .zero)
        
        messageLabel.text = message
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
        addSubview(messageLabel)
        addSubview(logoImageView)
    }
    
    private func anchorViews() {
        let centerYConstant: CGFloat = UIDevice().type == .iPhoneSE ? -120 : -150
        messageLabel.anchor(leading: leadingAnchor, trailing: trailingAnchor, margin: .init(top: 0, left: 40, bottom: 0, right: 40), size: .init(width: 0, height: 200))
        messageLabel.centerY(inView: self, constant: centerYConstant)
        
        logoImageView.anchor(bottom: bottomAnchor, trailing: trailingAnchor, margin: .init(top: 0, left: 0, bottom: -40, right: -200))
        logoImageView.anchorHW(height: widthAnchor, width: widthAnchor, hMultiplier: 1.3, wMultiplier: 1.3)
    }
}
