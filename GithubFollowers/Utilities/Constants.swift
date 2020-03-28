//
//  Constants.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 7/3/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import Foundation

enum SFSymbols {
    static let location = "mappin.and.ellipse"
    static let repos = "folder"
    static let gists = "text.alignleft"
    static let followers = "heart"
    static let following = "person.2"
}

enum Keys {
    static let favorites = "favorites"
}

enum Text {
    static let getFollowers = NSLocalizedString("get_followers", comment: "Get Followers")
    static let errorTitleDefault = NSLocalizedString("title_default", comment: "Something went wrong")
    static let errorMessageDefault = NSLocalizedString("message_default", comment: "Unable to complete request")
    static let errorTitle = NSLocalizedString("title_error", comment: "Bad things happened")
    static let publicRepos = NSLocalizedString("public_repos", comment: "Public Repos")
    static let publicGists = NSLocalizedString("public_gists", comment: "Public Gists")
    static let followers = NSLocalizedString("followers", comment: "Followers")
    static let following = NSLocalizedString("following", comment: "Following")
    static let invalidUrlTitle = NSLocalizedString("invalidUrlTitle", comment: "Invalid url title")
    static let invalidUrlMessage = NSLocalizedString("invalidUrlMessage", comment: "Invalid url message")
    static let ok = NSLocalizedString("ok", comment: "OK")
    static let noFollowersTitle = NSLocalizedString("noFollowersTitle", comment: "No followers title")
    static let noFollowersMessage = NSLocalizedString("noFollowersMessage", comment: "No followers message")
    static let emptyUsernameTitle = NSLocalizedString("empty_username_title", comment: "Empty username title")
    static let emptyUsernameMessage = NSLocalizedString("empty_username_message", comment: "Empty username message")
    static let success = NSLocalizedString("success", comment: "Success")
    static let favoritedSuccessful = NSLocalizedString("favorited_successful", comment: "Favorited successful")
    static let favorites = NSLocalizedString("favorites", comment: "Favorites")
    static let noFavorites = NSLocalizedString("no_favorites", comment: "No favorites")
}
