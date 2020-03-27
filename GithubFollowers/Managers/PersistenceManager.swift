//
//  PersistenceManager.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 25/3/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    static func retrieveFavorites(completed: @escaping(Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.data(forKey: Keys.favorites) else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let followers = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(followers))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func save(favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
