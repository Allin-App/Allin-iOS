//
//  User.swift
//  AllIn
//
//  Created by Emre on 11/10/2023.
//

import Foundation

class User {
    
    public var username: String
    public var email: String
    public var nbCoins: Int
    
    public init(username: String, email: String, nbCoins: Int)
    {
        self.username = username
        self.email = email
        self.nbCoins = nbCoins
    }
}
