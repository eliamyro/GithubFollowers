//
//  GFUserInfoHeaderVC.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 6/3/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class GFUserInfoHeaderVC: UIViewController {
    
    // MARK: - Properties
    
    var cView = GFUserInfoHeaderView()
    
    var user: User?

    // MARK: - Lifecycle
    
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
        
        configureUI()
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        guard let user = self.user else { return }
        
        downloadAvatarImage(user: user)
        cView.usernameLabel.text = user.login
        cView.nameLabel.text = user.name
        cView.locationLabel.text = user.location ?? "No location"
        cView.bioLabel.text = user.bio
    }
    
    private func downloadAvatarImage(user: User) {
        NetworkManager.shared.downloadImage(from: user.avatarUrl) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async { self.cView.avatarImageView.image = image }
        }
    }
}
