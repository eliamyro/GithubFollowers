//
//  UserInfoVC.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 3/3/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

protocol UserInfoVCDelegate: class {
    func didTapGithubProfile(for user: User)
    func didTapGetFollowers(for user: User)
}

class UserInfoVC: UIViewController {
    
    // MARK: - Properties
    
    var cView = UserInfoView()
    
    lazy var doneBarButton: UIBarButtonItem = {
        UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
    }()
    
    var follower: Follower?
    weak var delegate: FollowersListVCDelegate?
    
    // MARK: - Lifecycle
    
    override func loadView() { view = cView }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        getUserInfo()
    }
    
    // MARK: - Helpers
    
    private func configure() {
        navigationItem.rightBarButtonItem = doneBarButton
    }
    
    private func getUserInfo() {
        guard let follower = self.follower else { return }
        
        NetworkManager.shared.getUserInfo(for: follower.login) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                DispatchQueue.main.async { self.configureUIElements(with: user) }
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: Text.errorTitleDefault , message: error.rawValue, buttonTitle: Text.ok)
            }
        }
    }
    
    private func configureUIElements(with user: User) {
        let repoItem = GFRepoItemVC(user: user)
        repoItem.delegate = self
        
        let followerItem = GFFollowerItemVC(user: user)
        followerItem.delegate = self
        
        self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.cView.headerView)
        self.add(childVC: repoItem, to: self.cView.itemViewOne)
        self.add(childVC: followerItem, to: self.cView.itemViewTwo)
        self.cView.dateLabel.text = "GitHub since \(user.createdAt.formatToMonthYearFormat())"
    }
    
    private func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    // MARK: - Selectors
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
}

// MARK: - Extensions

extension UserInfoVC: UserInfoVCDelegate {
    func didTapGithubProfile(for user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentGFAlertOnMainThread(title: Text.invalidUrlTitle, message: Text.invalidUrlMessage, buttonTitle: Text.ok)
            return
        }
        
        presentSafariVC(with: url)
    }
    
    func didTapGetFollowers(for user: User) {
        guard user.followers != 0 else { presentGFAlertOnMainThread(title: Text.noFollowersTitle, message: Text.noFollowersMessage, buttonTitle: Text.ok)
            return
        }
    
        dismiss(animated: true) {
            self.delegate?.didRequestFollowers(for: user.login)
        }
    }
}
