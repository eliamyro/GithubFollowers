//
//  GFLoadingView.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 1/3/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class GFLoadingView: UIView {
    
    // MARK: - Properties
    
    lazy var indicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        activityIndicator.startAnimating()
        
        return activityIndicator
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
        addViews()
        anchorViews()
    }
    
    private func addViews() {
        addSubview(indicator)
    }
    
    private func anchorViews() {
        indicator.center(inView: self)
    }
    
    func fadeIn() {
        backgroundColor = .systemBackground
        alpha = 0.0
        
        UIView.animate(withDuration: 0.5) {
            self.alpha = 0.8
        }
    }
}
