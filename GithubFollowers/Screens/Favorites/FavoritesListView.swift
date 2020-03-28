//
//  FavoritesListView.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 28/3/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class FavoritesListView: UIView {
    
    // MARK: - Properties
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
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
        backgroundColor = .systemBackground
        
        addViews()
        anchorViews()
    }
    
    private func addViews() {
        addSubview(tableView)
    }
    
    private func anchorViews() {
        tableView.anchorToFillView(self)
    }
}
