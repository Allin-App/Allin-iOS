//
//  MatchParticipation.swift
//  
//
//  Created by Emre on 28/12/2023.
//

import Foundation

/// A subclass of Participation that represents a user's participation in a match bet.
public class MatchParticipation: Participation {
    /// The points earned by the user for the first team in the match.
    public var pointsTeam1: Int
    
    /// The points earned by the user for the second team in the match.
    public var pointsTeam2: Int
    
    /// Custom Constructor
    ///
    /// - Parameters:
    ///   - coinAmount: The amount of coins involved in the match participation.
    ///   - date: The date and time when the match participation occurred.
    ///   - user: The user who participated in the match bet.
    ///   - bet: The match bet in which the user participated.
    ///   - pointsTeam1: The points earned by the user for the first team in the match.
    ///   - pointsTeam2: The points earned by the user for the second team in the match.
    public init(coinAmount: Int, date: Date, user: User, bet: Bet, pointsTeam1: Int, pointsTeam2: Int) {
        self.pointsTeam1 = pointsTeam1
        self.pointsTeam2 = pointsTeam2
        super.init(coinAmount: coinAmount, date: date, user: user, bet: bet)
    }
}
