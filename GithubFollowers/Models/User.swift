//
//  User.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 25/2/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import Foundation

struct User: Codable {
    let login: String
    let avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    let publicRepos: Int
    let publicGists: Int
    let htmlUrl: String
    let followers: Int
    let following: Int
    let createdAt: Date
}
