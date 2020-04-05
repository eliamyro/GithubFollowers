//
//  GFDataLoadingVC.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 5/4/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

class GFDataLoadingVC: UIViewController {
    
    lazy var loadingView: GFLoadingView = {
        return GFLoadingView(frame: view.bounds)
    }()

    func showEmptyStateView(with message: String, in view: UIView) {
        let emptyStateView = GFEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
    
        view.addSubview(emptyStateView)
    }
    
    func showLoadingView() {
        view.addSubview(loadingView)
        loadingView.fadeIn()
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async { self.loadingView.removeFromSuperview() }
    }

}
