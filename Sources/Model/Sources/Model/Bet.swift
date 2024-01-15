//
//  Bet.swift
//  
//
//  Created by Emre on 28/12/2023.
//

import Foundation

/// A class representing a betting entity, including details about the bet theme, participants, and deadlines.
public class Bet: ObservableObject, Identifiable {
    
    /// The id for the bet.
    public var id = UUID()
    
    /// The theme or topic of the bet.
    public private(set) var theme: String
    
    /// The specific phrase or question related to the bet.
    public private(set) var phrase:  String
    
    /// The deadline for users to register for the bet.
    public private(set) var endRegisterDate: Date
    
    /// The deadline for the actual betting to take place.
    public private(set) var endBetDate: Date
    
    /// The total stakes or amount involved in the bet.
    public private(set) var totalStakes: Int
    
    /// Indicates whether the bet is public or private.
    public private(set) var isPublic: Bool
    
    /// List of users who are invited to participate in the bet.
    public private(set) var invited: [User]
    
    /// The user who created the bet.
    public private(set) var author: User
    
    /// List of users who have registered for the bet.
    public private(set) var registered: [User]

    /// Custom Constructor
    ///
    /// - Parameters:
    ///   - theme: The theme or topic of the bet.
    ///   - phrase: The specific phrase or question related to the bet.
    ///   - endRegisterDate: The deadline for users to register for the bet.
    ///   - endBetDate: The deadline for the actual betting to take place.
    ///   - totalStakes: The total stakes or amount involved in the bet.
    ///   - isPublic: Indicates whether the bet is public or private.
    ///   - invited: List of users who are invited to participate in the bet.
    ///   - author: The user who created the bet.
    ///   - registered: List of users who have registered for the bet.
    public init(theme: String, phrase: String, endRegisterDate: Date, endBetDate: Date, totalStakes: Int, isPublic: Bool, invited: [User], author: User, registered: [User]) {
        self.theme = theme
        self.phrase = phrase
        self.endRegisterDate = endRegisterDate
        self.endBetDate = endBetDate
        self.totalStakes = totalStakes
        self.isPublic = isPublic
        self.invited = invited
        self.author = author
        self.registered = registered
    }
}
