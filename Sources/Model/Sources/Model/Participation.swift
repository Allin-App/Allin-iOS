//
//  Participation.swift
//  
//
//  Created by Emre on 28/12/2023.
//

import Foundation

/// A class representing a user's participation in a bet, including the amount of coins, date, user, and the associated bet.
public class Participation: ObservableObject {
    /// The amount of coins involved in the participation.
    var coinAmount: Int
    
    /// The date and time when the participation occurred.
    var date: Date
    
    /// The user who participated in the bet.
    var user: User
    
    /// The bet in which the user participated.
    var bet: Bet
    
    /// Custom Constructor
    ///
    /// - Parameters:
    ///   - coinAmount: The amount of coins involved in the participation.
    ///   - date: The date and time when the participation occurred.
    ///   - user: The user who participated in the bet.
    ///   - bet: The bet in which the user participated.
    init(coinAmount: Int, date: Date, user: User, bet: Bet) {
        self.coinAmount = coinAmount
        self.date = date
        self.user = user
        self.bet = bet
    }
}
