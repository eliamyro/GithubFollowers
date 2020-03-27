//
//  SearchVCViewController.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 22/2/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    // MARK: - Properties
    
    private var cView = SearchView()
    
    private var isUsernameEntered: Bool {
        return !(cView.usernameTextField.text?.isEmpty ?? false)
    }
    
    // MARK: - Lifecycle
    
    override func loadView() { view = cView }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Helpers
    
    private func configure() {
        cView.usernameTextField.delegate = self
        cView.actionButton.addTarget(self, action: #selector(pushFollowersListVC), for: .touchUpInside)
    }
    
    private func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - Selectors
    
    @objc private func pushFollowersListVC() {
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(title: Text.emptyUsernameTitle, message: Text.emptyUsernameMessage, buttonTitle: Text.ok)
            return
        }
        
        let followersListVC = FollowersListVC()
        followersListVC.username = cView.usernameTextField.text
        navigationController?.pushViewController(followersListVC, animated: true)
    }
}

// MARK: - Extensions

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowersListVC()
        
        return true
    }
}
