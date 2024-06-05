//
//  Participation.swift
//
//
//  Created by Emre on 28/12/2023.
//

import Foundation

/// A class representing a user's participation in a bet.
public class Participation: ObservableObject, Codable, Identifiable, Hashable {
    
    /// The amount of stake in the bet.
    public private(set) var stake: Int
    
    /// The response or outcome of the participation.
    public private(set) var answer: String
    
    /// The user who participated in the bet.
    public private(set) var username: String
    
    /// The unique identifier of the bet.
    public private(set) var betId: String
    
    /// Custom Constructor
    ///
    /// - Parameters:
    ///   - stake: The amount of stake in the bet.
    ///   - answer: The response or outcome of the participation.
    ///   - username: The user who participated in the bet.
    ///   - betId: The unique identifier of the bet.
    public init(stake: Int, answer: String, username: String, betId: String) {
        self.stake = stake
        self.answer = answer
        self.username = username
        self.betId = betId
    }
    
    // Conformance to Equatable
    public static func == (lhs: Participation, rhs: Participation) -> Bool {
        return lhs.stake == rhs.stake &&
               lhs.answer == rhs.answer &&
               lhs.username == rhs.username &&
               lhs.betId == rhs.betId
    }
    
    // Conformance to Hashable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(stake)
        hasher.combine(answer)
        hasher.combine(username)
        hasher.combine(betId)
    }
}
