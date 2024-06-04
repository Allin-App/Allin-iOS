//
//  User.swift
//
//
//  Created by Emre on 11/10/2023.
//

import Foundation

/// A struct representing a user with details such as username, email, number of coins, and friends.
public struct User: Codable, Hashable, Identifiable {
    
    public var id: String {
            return email
    }
    /// The username of the user.
    public private(set) var username: String
    
    /// The email address of the user.
    public private(set) var email: String
    
    /// The number of coins associated with the user.
    public var nbCoins: Int
    
    /// The friendship status with the main user.
    public var friendStatus: FriendStatus?
    
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
    
    /// Custom constructor to initialize a User instance.
    ///
    /// - Parameters:
    ///   - username: The username of the user.
    ///   - email: The email address of the user.
    ///   - nbCoins: The number of coins associated with the user.
    ///   - status: The friendship status with the main user.
    public init(username: String, email: String, nbCoins: Int, status: FriendStatus) {
        self.username = username
        self.email = email
        self.nbCoins = nbCoins
        self.friendStatus = status
    }
}
