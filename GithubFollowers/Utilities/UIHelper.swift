//
//  UIHelper.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 27/2/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

struct UIHelper {
    
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        let flowFlayout = UICollectionViewFlowLayout()
        flowFlayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowFlayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowFlayout
    }
}
