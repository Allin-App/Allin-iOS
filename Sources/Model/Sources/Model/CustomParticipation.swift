//
//  CustomParticipation.swift
//  
//
//  Created by Emre on 28/12/2023.
//

import Foundation

/// A subclass of Participation that represents a custom participation in a bet.
public class CustomParticipation: Participation {
    /// The user's response to the custom bet.
    public var answer: CustomBetResponse
    
    /// Custom Constructor
    ///
    /// - Parameters:
    ///   - coinAmount: The amount of coins involved in the custom participation.
    ///   - date: The date and time when the custom participation occurred.
    ///   - user: The user who participated in the custom bet.
    ///   - bet: The custom bet in which the user participated.
    ///   - answer: The user's response to the custom bet.
    public init(coinAmount: Int, date: Date, user: User, bet: Bet, answer: CustomBetResponse) {
        self.answer = answer
        super.init(coinAmount: coinAmount, date: date, user: user, bet: bet)
    }
}
