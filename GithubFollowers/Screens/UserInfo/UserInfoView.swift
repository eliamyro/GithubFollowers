//
//  UserInfoView.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 6/3/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class UserInfoView: UIView {
    
    // MARK: - Properties
    
    lazy var headerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var itemViewOne: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var itemViewTwo: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var dateLabel = GFBodyLabel(textAlignment: .center)
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        anchorViews()
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
        let itemViews = [headerView, itemViewOne, itemViewTwo, dateLabel]
        for itemView in itemViews { addSubview(itemView) }
    }
    
    private func anchorViews() {
        let padding: CGFloat = 20
        
        headerView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, trailing: trailingAnchor, margin: .init(top: 0, left: padding, bottom: 0, right: padding), size: .init(width: 0, height: 180))
        
        itemViewOne.anchor(top: headerView.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, margin: .init(top: padding, left: padding, bottom: 0, right: padding), size: .init(width: 0, height: 140))
        
        itemViewTwo.anchor(top: itemViewOne.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, margin: .init(top: padding, left: padding, bottom: 0, right: padding), size: .init(width: 0, height: 140))
        
        dateLabel.anchor(top: itemViewTwo.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, margin: .init(top: padding, left: padding, bottom: 0, right: padding), size: .init(width: 0, height: 18))
    }
}
