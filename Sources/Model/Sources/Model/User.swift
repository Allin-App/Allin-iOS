//
//  User.swift
//
//
//  Created by Emre on 11/10/2023.
//

import Foundation

public struct User {
    public var username: String
    public var email: String
    public var nbCoins: Int
    public var friends: [User]
    
    public init(username: String, email: String, nbCoins: Int, friends: [User]) {
        self.username = username
        self.email = email
        self.nbCoins = nbCoins
        self.friends = friends
    }
    
    public mutating func addFriend(user: User) {
        self.friends.append(user)
    }
    
    public static func mapUser(from json: [String: Any]) -> User? {
        guard let username = json["username"] as? String,
              let email = json["email"] as? String,
              let nbCoins = json["nbCoins"] as? Int else {
            return nil
        }
        
        return User(username: username, email: email, nbCoins: nbCoins, friends: [])
    }
}