//
//  BinaryParticipation.swift
//  
//
//  Created by Emre on 28/12/2023.
//

import Foundation

/// Enum to represent the possible answers for a binary participation.
public enum YesNo {
    case yes
    case no
}

/// A subclass of Participation that represents a binary participation (yes/no) in a bet.
public class BinaryParticipation: Participation {
    /// The answer for the binary participation (yes or no).
    public var answer: YesNo
    
    /// Custom Constructor
    ///
    /// - Parameters:
    ///   - coinAmount: The amount of coins involved in the binary participation.
    ///   - date: The date and time when the binary participation occurred.
    ///   - user: The user who participated in the binary bet.
    ///   - bet: The binary bet in which the user participated.
    ///   - answer: The answer for the binary participation (yes or no).
    public init(coinAmount: Int, date: Date, user: User, bet: Bet, answer: YesNo) {
        self.answer = answer
        super.init(coinAmount: coinAmount, date: date, user: user, bet: bet)
    }
}
