//
//  Participation.swift
//
//
//  Created by Emre on 28/12/2023.
//

import Foundation

/// A class representing a user's participation in a bet.
public class Participation: ObservableObject {

    /// The amount of stake in the bet.
    public private(set) var stake: Int
    
    /// The date and time when the participation occurred.
    public private(set) var date: Date
    
    /// The response or outcome of the participation.
    public private(set) var response: String
    
    /// The user who participated in the bet.
    public private(set) var user: User
    
    /// The unique identifier of the bet.
    let betId: String
    
    /// Custom Constructor
    ///
    /// - Parameters:
    ///   - stake: The amount of stake in the bet.
    ///   - date: The date and time when the participation occurred.
    ///   - response: The response or outcome of the participation.
    ///   - user: The user who participated in the bet.
    ///   - betId: The unique identifier of the bet.
    public init(stake: Int, date: Date, response: String, user: User, betId: String) {
        self.stake = stake
        self.date = date
        self.response = response
        self.user = user
        self.betId = betId
    }
}
