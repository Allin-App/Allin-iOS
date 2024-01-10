//
//  BinaryBet.swift
//  
//
//  Created by Emre on 28/12/2023.
//

import Foundation

public struct BinaryBet: Bet {    
    public var theme: String
    public var phrase: String
    public var endRegisterDate: Date
    public var endBetDate: Date
    public var totalStakes: Int
    public var isPublic: Bool
    public var invited: [User]
    public var author: User
    public var registered: [User]
    
    public init(
        theme: String,
        phrase: String,
        endRegisterDate: Date,
        endBetDate: Date,
        totalStakes: Int,
        isPublic: Bool,
        invited: [User],
        author: User,
        registered: [User]
    ) {
        self.theme = theme
        self.phrase = phrase
        self.endRegisterDate = endRegisterDate
        self.endBetDate = endBetDate
        self.totalStakes = totalStakes
        self.isPublic = isPublic
        self.invited = invited
        self.author = author
        self.registered = registered
    }
    
}
