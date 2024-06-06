//
//  BetResultDetail.swift
//  
//
//  Created by Emre on 06/06/2024.
//

import Foundation

public class BetResultDetail: Codable {
        
    public private(set) var betResult: BetResult

    public private(set) var bet: Bet
    
    public private(set) var participation: Participation
    
    public private(set) var amount: Int

    public private(set) var won: Bool
    
    public init(betResult: BetResult, bet: Bet, participation: Participation, amount: Int, won: Bool) {
        self.betResult = betResult
        self.bet = bet
        self.participation = participation
        self.amount = amount
        self.won = won
    }
    
}
