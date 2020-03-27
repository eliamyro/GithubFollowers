//
//  GFAlertVC.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 24/2/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class GFAlertVC: UIViewController {
    
    // MARK: - Properties
    
    var cView = GFAlertView()
    
    // MARK: - Lifecycle
    
    init(alertTitle: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        
        cView.titleLabel.text =  alertTitle
        cView.messageLabel.text = message
        cView.actionButton.setTitle(buttonTitle, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = cView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    // MARK: - Helpers
    
    private func configure() {
        cView.actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    }
    
    @objc private func dismissVC() {
        dismiss(animated: true)
   }
}
