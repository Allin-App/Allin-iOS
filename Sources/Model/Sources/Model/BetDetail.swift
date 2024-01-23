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
    public private(set) var answers: [BetAnswerDetail]

    /// List of user participations in the bet.
    public private(set) var participations: [Participation]
    
    /// The user's own participation in the bet.
    public private(set) var userParticipation: Participation
    
    public private(set) var finalAnswer: String?
    
    /// Custom Constructor
    ///
    /// - Parameters:
    ///   - bet: The main bet information.
    ///   - answers: Details about the answers available for the bet.
    ///   - participations: List of user participations in the bet.
    ///   - userParticipation: The user's own participation in the bet.
    public init(bet: Bet, answers: [BetAnswerDetail], participations: [Participation], userParticipation: Participation, finalAnswer: String? = nil) {
        self.bet = bet
        self.answers = answers
        self.participations = participations
        self.userParticipation = userParticipation
        self.finalAnswer = finalAnswer
    }
    
    public func updateFinalAnswer(newFinalAnswer: String) {
            self.finalAnswer = newFinalAnswer
        }
    
    public func addParticipation(newParticipation: Participation){
        if !self.bet.registered.contains(where: { existingUser in
            return existingUser.email == newParticipation.user.email
        }) {
                self.bet.addRegistered(newUser: newParticipation.user)
            }

            self.participations.append(newParticipation)
    }
}
