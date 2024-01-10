//
//  MatchBet.swift
//  
//
//  Created by Emre on 28/12/2023.
//

import Foundation

public struct MatchBet: Bet {
    public var theme: String
    public var phrase: String
    public var endRegisterDate: Date
    public var endBetDate: Date
    public var totalStakes: Int
    public var isPublic: Bool
    public var invited: [User]
    public var author: User
    public var registered: [User]
    public var nameTeam1: String
    public var nameTeam2: String
    
}
