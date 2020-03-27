//
//  FollowersView.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 5/3/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class FollowersView: UIView {
    
//    lazy var followersCollectionView: UICollectionView = {
//        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 500, height: 500), collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: self))
//        collectionView.backgroundColor = .systemRed
//        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//
//        return collectionView
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        anchorViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func anchorViews() {
//        anchorFollowersCollectionView()
    }
    
    func anchorFollowersCollectionView() {
//        addSubview(followersCollectionView)
        
//        NSLayoutConstraint.activate([
//            followersCollectionView.topAnchor.constraint(equalTo: topAnchor),
//            followersCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            followersCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            followersCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
//        ])
    }
}
