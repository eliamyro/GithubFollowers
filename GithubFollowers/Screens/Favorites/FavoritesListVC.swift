//
//  FavoritesListVC.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 22/2/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class FavoritesListVC: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        
        let label = GFTitleLabel(textAlignment: .center, fontSize: 36)
        
        view.addSubview(label)
        
        label.center(inView: view)
        label.text = "Hello There"
    }
}
