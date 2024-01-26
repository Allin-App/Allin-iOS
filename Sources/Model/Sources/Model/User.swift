//
//  User.swift
//
//
//  Created by Emre on 11/10/2023.
//

import Foundation

/// A struct representing a user with details such as username, email, number of coins, and friends.
public struct User {
    
    /// The username of the user.
    public private(set) var username: String
    
    /// The email address of the user.
    public private(set) var email: String
    
    /// The number of coins associated with the user.
    public var nbCoins: Int
    
    /// List of friends associated with the user.
    public private(set) var friends: [User]
    
    /// Custom constructor to initialize a User instance.
    ///
    /// - Parameters:
    ///   - username: The username of the user.
    ///   - email: The email address of the user.
    ///   - nbCoins: The number of coins associated with the user.
    ///   - friends: List of friends associated with the user.
    public init(username: String, email: String, nbCoins: Int, friends: [User]) {
        self.username = username
        self.email = email
        self.nbCoins = nbCoins
        self.friends = friends
    }
    
    /// Adds a new friend to the list of friends for the user.
    ///
    /// - Parameter user: The user to be added as a friend.
    public mutating func addFriend(user: User) {
        self.friends.append(user)
    }
    
    /// Maps user data from a JSON dictionary to create a User instance.
    ///
    /// - Parameter json: The JSON dictionary containing user data.
    /// - Returns: An optional User instance if mapping is successful, otherwise nil.
    public static func mapUser(from json: [String: Any]) -> User? {
        guard let username = json["username"] as? String,
              let email = json["email"] as? String,
              let nbCoins = json["nbCoins"] as? Int else {
            return nil
        }
        
        return User(username: username, email: email, nbCoins: nbCoins, friends: [])
    }
}
