//
//  BinaryBet.swift
//  
//
//  Created by Emre on 28/12/2023.
//

import Foundation

/// A subclass of Bet that represents a binary bet, where participants make a choice between two possible outcomes.
public class BinaryBet: Bet {
    
    // Custom Constructor
    ///
    /// - Parameters:
    ///   - theme: The theme or topic of the binary bet.
    ///   - phrase: The specific phrase or question related to the binary bet.
    ///   - endRegisterDate: The deadline for users to register for the binary bet.
    ///   - endBetDate: The deadline for the actual betting to take place for the binary bet.
    ///   - totalStakes: The total stakes or amount involved in the binary bet.
    ///   - isPublic: Indicates whether the binary bet is public or private.
    ///   - invited: List of users who are invited to participate in the binary bet.
    ///   - author: The user who created the binary bet.
    ///   - registered: List of users who have registered for the binary bet.
    public override init(theme: String, phrase: String, endRegisterDate: Date, endBetDate: Date, totalStakes: Int, isPublic: Bool, invited: [User], author: User, registered: [User]) {
        super.init(theme: theme, phrase: phrase, endRegisterDate: endRegisterDate, endBetDate: endBetDate, totalStakes: totalStakes, isPublic: isPublic, invited: invited, author: author, registered: registered)
    }
}
