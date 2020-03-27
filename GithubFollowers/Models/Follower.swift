//
//  Follower.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 25/2/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import Foundation

struct Follower: Codable, Hashable {
    
    var login: String
    var avatarUrl: String
}
