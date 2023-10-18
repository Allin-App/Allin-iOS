//
//  User.swift
//  AllIn
//
//  Created by étudiant on 11/10/2023.
//

import Foundation

class User {
    
    public var Username: String
    public var Email: String
    public var NbCoins: Int

    public init(Username: String, andEmail Email: String, NbCoins: Int) {
        self.Username = Username
        self.Email = Email
        self.NbCoins = NbCoins
    }
}
