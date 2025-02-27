//
//  BetDetail.swift
//
//
//  Created by Emre on 19/01/2024.
//

import Foundation

/// A class representing detailed information about a specific bet, including answers and user participations.
public class BetDetail: ObservableObject {
    
    /// The main bet information.
    public private(set) var bet: Bet
    
    /// Details about the answers available for the bet.
    public private(set) var answers: [AnswerDetail]

    /// List of user participations in the bet.
    public private(set) var participations: [Participation]
    
    /// The final answer selected for the bet, if available.
    public private(set) var wonParticipation: Participation?
    public private(set) var userParticipation: Participation?
    
    public var odds: Float? {
        guard let wonParticipation = self.wonParticipation else {
            return nil
        }
        if let matchingAnswer = self.answers.first(where: { $0.response == wonParticipation.answer }) {
            return matchingAnswer.odds
        } else {
            return nil
        }
    }
    
    /// Custom Constructor
    ///
    /// - Parameters:
    ///   - bet: The main bet information.
    ///   - answers: Details about the answers available for the bet.
    ///   - participations: List of user participations in the bet.
    ///   - finalAnswer: The final answer selected for the bet, if available.
    public init(bet: Bet, answers: [AnswerDetail], participations: [Participation], wonParticipation: Participation? = nil, userParticipation: Participation? = nil) {
        self.bet = bet
        self.answers = answers
        self.participations = participations
        self.wonParticipation = wonParticipation
        self.userParticipation = userParticipation
    }
    
    /// Updates the final answer selected for the bet.
    ///
    /// - Parameter newFinalAnswer: The new final answer for the bet.
    public func updateFinalAnswer(wonParticipation: Participation) {
        self.wonParticipation = wonParticipation
    }
    
    /// Adds a new user participation to the list of participations for the bet.
    ///
    /// - Parameter newParticipation: The new user participation to be added.
    public func addParticipation(newParticipation: Participation) {
        self.participations.append(newParticipation)
    }
}
