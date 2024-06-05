//
//  User.swift
//
//
//  Created by Emre on 11/10/2023.
//

import Foundation

/// A struct representing a user with details such as username, email, number of coins, and friends.
public struct User: Codable, Hashable {
    
    /// The username of the user.
    public private(set) var username: String
    
    /// The email address of the user.
    public private(set) var email: String
    
    /// The number of coins associated with the user.
    public var nbCoins: Int
    
    /// The friendship status with the main user.
    public var friendStatus: FriendStatus?
    
    /// The user's profile image.
    public var image: String?
    
    /// The number of bets made by the user.
    public var nbBets: Int
    
    /// The number of friends the user has.
    public var nbFriends: Int
    
    /// The user's best win.
    public var bestWin: Int
    
    /// Custom constructor to initialize a User instance.
    ///
    /// - Parameters:
    ///   - username: The username of the user.
    ///   - email: The email address of the user.
    ///   - nbCoins: The number of coins associated with the user.
    ///   - friendStatus: The friendship status with the main user.
    ///   - image: The user's profile image.
    ///   - nbBets: The number of bets made by the user.
    ///   - nbFriends: The number of friends the user has.
    ///   - bestWin: The user's best win.
    public init(username: String, email: String, nbCoins: Int, friendStatus: FriendStatus? = nil, image: String? = nil, nbBets: Int, nbFriends: Int, bestWin: Int) {
        self.username = username
        self.email = email
        self.nbCoins = nbCoins
        self.friendStatus = friendStatus
        self.image = image
        self.nbBets = nbBets
        self.nbFriends = nbFriends
        self.bestWin = bestWin
    }
}
