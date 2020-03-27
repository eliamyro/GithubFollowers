//
//  GFItemInfoVC.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 21/3/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class GFInfoItemsVC: UIViewController {
    
    // MARK: - Properties
    
    let cView = GFInfoItemsView()
    var user: User?
    weak var delegate: UserInfoVCDelegate?
    
    // MARK: Lifecycle
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = cView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureeActionButton()
    }
    
    // MARK: - Helpers
    
    private func configureeActionButton() {
        cView.actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Selectors
    
    @objc func actionButtonTapped() {}
}
