//
//  Participation.swift
//
//
//  Created by Emre on 28/12/2023.
//

import Foundation

/// A class representing a user's participation in a bet.
public class Participation: ObservableObject, Codable, Identifiable {
    
    public let id: String
    
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
    ///   - date: The date and time when the participation occurred.
    ///   - response: The response or outcome of the participation.
    ///   - user: The user who participated in the bet.
    ///   - betId: The unique identifier of the bet.
    public init(id: String, stake: Int, answer: String, username: String, betId: String) {
        self.id = id
        self.stake = stake
        self.answer = answer
        self.username = username
        self.betId = betId
    }
}
