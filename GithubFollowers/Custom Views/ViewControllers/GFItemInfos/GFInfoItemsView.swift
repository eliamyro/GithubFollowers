//
//  GFItemInfoView.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 21/3/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class GFInfoItemsView: UIView {
    
    // MARK: - Properties
    
    lazy var infosStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [infoItem1, infoItem2])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    lazy var infoItem1: GFItemInfoView = {
        let itemInfo = GFItemInfoView()
        
        return itemInfo
    }()
    
    lazy var infoItem2: GFItemInfoView = {
        let itemInfo = GFItemInfoView()
        
        return itemInfo
    }()
    
    lazy var actionButton: GFButton = {
        let button = GFButton()
        
        return button
    }()

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
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 18
        
        addViews()
        anchorViews()
    }
    
    private func addViews() {
        addSubview(infosStackView)
        addSubview(actionButton)
    }
    
    private func anchorViews() {
        let padding: CGFloat = 20
        
        infosStackView.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, margin: .init(top: padding, left: padding, bottom: 0, right: padding), size: .init(width: 0, height: 50))
        
        actionButton.anchor(leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, margin: .init(top: 0, left: padding, bottom: padding, right: padding), size: .init(width: 0, height: 44))
    }
    
}
