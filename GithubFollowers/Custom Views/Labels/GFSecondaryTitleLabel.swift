//
//  GFSecondaryTitleLabel.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 6/3/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class GFSecondaryTitleLabel: UILabel {

    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(fontSize: CGFloat) {
        super.init(frame: .zero)
        
        font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        
        configureUI()
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        textColor = .secondaryLabel
        textAlignment = .natural
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
    }
}
