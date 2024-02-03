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
    public private(set) var id: String
    
    /// The theme or topic of the bet.
    public private(set) var theme: String
    
    /// The specific phrase or question related to the bet.
    public private(set) var phrase:  String
    
    /// The deadline for users to register for the bet.
    public private(set) var endRegisterDate: Date
    
    /// The deadline for the actual betting to take place.
    public private(set) var endBetDate: Date
    
    /// Indicates whether the bet is public or private.
    public private(set) var isPublic: Bool
    
    /// The current status of the bet.
    public private(set) var status: BetStatus
    
    /// List of users who are invited to participate in the bet.
    public private(set) var invited: [User]
    
    /// The user who created the bet.
    public private(set) var author: User
    
    /// List of users who have registered for the bet.
    public private(set) var registered: [User]
    

    /// Custom Constructor
    ///
    /// - Parameters:
    ///   - id: The id for the bet.
    ///   - theme: The theme or topic of the bet.
    ///   - phrase: The specific phrase or question related to the bet.
    ///   - endRegisterDate: The deadline for users to register for the bet.
    ///   - endBetDate: The deadline for the actual betting to take place.
    ///   - isPublic: Indicates whether the bet is public or private.
    ///   - status: The current status of the bet.
    ///   - invited: List of users who are invited to participate in the bet.
    ///   - author: The user who created the bet.
    ///   - registered: List of users who have registered for the bet.
    public init(id: String, theme: String, phrase: String, endRegisterDate: Date, endBetDate: Date, isPublic: Bool, status: BetStatus, invited: [User], author: User, registered: [User]) {
        self.id = id
        self.theme = theme
        self.phrase = phrase
        self.endRegisterDate = endRegisterDate
        self.endBetDate = endBetDate
        self.isPublic = isPublic
        self.status = status
        self.invited = invited
        self.author = author
        self.registered = registered
    }
    
    /// Custom Constructor without Id
    ///
    /// - Parameters:
    ///   - theme: The theme or topic of the bet.
    ///   - phrase: The specific phrase or question related to the bet.
    ///   - endRegisterDate: The deadline for users to register for the bet.
    ///   - endBetDate: The deadline for the actual betting to take place.
    ///   - isPublic: Indicates whether the bet is public or private.
    ///   - status: The current status of the bet.
    ///   - invited: List of users who are invited to participate in the bet.
    ///   - author: The user who created the bet.
    ///   - registered: List of users who have registered for the bet.
    public init(theme: String, phrase: String, endRegisterDate: Date, endBetDate: Date, isPublic: Bool, status: BetStatus, invited: [User], author: User, registered: [User]) {
        self.id = UUID().uuidString
        self.theme = theme
        self.phrase = phrase
        self.endRegisterDate = endRegisterDate
        self.endBetDate = endBetDate
        self.isPublic = isPublic
        self.status = status
        self.invited = invited
        self.author = author
        self.registered = registered
    }
    
    /// Adds a new user to the list of registered participants for the bet.
    ///
    /// - Parameter newUser: The user to be added to the list of registered participants.
    public func addRegistered(newUser: User){
        self.registered.append(newUser)
    }
    
    public func isFinish() -> Bool{
        self.endBetDate < Date()
    }
}
