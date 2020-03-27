//
//  GFBodyLabel.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 24/2/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class GFBodyLabel: UILabel {

    // MARK: - Lifecycle
    
   override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        
        self.textAlignment = textAlignment
        
        configureUI()
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
    }
}
