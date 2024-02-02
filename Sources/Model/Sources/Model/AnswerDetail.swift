//
//  AnswerDetail.swift
//
//
//  Created by Emre on 19/01/2024.
//

import Foundation

/// A class representing detailed information about a specific answer option for a bet.
public class AnswerDetail: ObservableObject, Hashable {

    /// The response or outcome associated with this answer.
    public private(set) var response: String
    
    /// The total amount of stakes placed on this answer.
    public private(set) var totalStakes: Int
    
    /// The total number of participants who selected this answer.
    public private(set) var totalParticipants: Int
    
    /// The highest stake placed on this answer.
    public private(set) var highestStake: Int

    /// The odds associated with this answer.
    public private(set) var odds: Float
    
    /// Custom Constructor
    ///
    /// - Parameters:
    ///   - response: The response or outcome associated with this answer.
    ///   - totalStakes: The total amount of stakes placed on this answer.
    ///   - totalParticipants: The total number of participants who selected this answer.
    ///   - highestStake: The highest stake placed on this answer.
    ///   - odds: The odds associated with this answer.
    public init(response: String, totalStakes: Int, totalParticipants: Int, highestStake: Int, odds: Float) {
        self.response = response
        self.totalStakes = totalStakes
        self.totalParticipants = totalParticipants
        self.highestStake = highestStake
        self.odds = odds
    }
    
    public func hash(into hasher: inout Hasher) {
            // Use properties that define the uniqueness of the instance for hashing
            hasher.combine(response)
            // ... (combine other properties)
        }

        public static func == (lhs: AnswerDetail, rhs: AnswerDetail) -> Bool {
            // Check equality based on properties
            return lhs.response == rhs.response
                // ... (check other properties)
        }

}
