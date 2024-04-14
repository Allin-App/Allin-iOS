//
//  User.swift
//
//
//  Created by Emre on 11/10/2023.
//

import Foundation

/// A struct representing a user with details such as username, email, number of coins, and friends.
public struct User: Codable {
    
    /// The username of the user.
    public private(set) var username: String
    
    /// The email address of the user.
    public private(set) var email: String
    
    /// The number of coins associated with the user.
    public var nbCoins: Int
    
    /// Custom constructor to initialize a User instance.
    ///
    /// - Parameters:
    ///   - username: The username of the user.
    ///   - email: The email address of the user.
    ///   - nbCoins: The number of coins associated with the user.
    public init(username: String, email: String, nbCoins: Int) {
        self.username = username
        self.email = email
        self.nbCoins = nbCoins
    }
}
