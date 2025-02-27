//
//  MatchBet.swift
//
//
//  Created by Emre on 28/12/2023.
//

import Foundation

/// A subclass of Bet that represents a bet on a match between two teams.
public class MatchBet: Bet {
    
    /// The name of the first team involved in the match.
    public var nameTeam1: String
    
    /// The name of the second team involved in the match.
    public var nameTeam2: String
    
    private enum CodingKeys: String, CodingKey {
        case nameTeam1
        case nameTeam2
    }
    
    /// Custom Constructor
    ///
    /// - Parameters:
    ///   - id: The id for the bet.
    ///   - theme: The theme or topic of the match bet.
    ///   - phrase: The specific phrase or question related to the match bet.
    ///   - endRegisterDate: The deadline for users to register for the match bet.
    ///   - endBetDate: The deadline for the actual betting to take place for the match bet.
    ///   - isPublic: Indicates whether the match bet is public or private.
    ///   - status: The current status of the match bet.
    ///   - invited: List of users who are invited to participate in the match bet.
    ///   - author: The user who created the match bet.
    ///   - nameTeam1: The name of the first team involved in the match.
    ///   - nameTeam2: The name of the second team involved in the match.
    public init(id: String, theme: String, phrase: String, endRegisterDate: Date, endBetDate: Date, isPrivate: Bool, status: BetStatus, invited: [String], author: String, nameTeam1: String, nameTeam2: String) {
        self.nameTeam1 = nameTeam1
        self.nameTeam2 = nameTeam2
        super.init(id: id, theme: theme, phrase: phrase, endRegisterDate: endRegisterDate, endBetDate: endBetDate, isPrivate: isPrivate, status: status, invited: invited, author: author)
    }
    
    /// Custom Constructor without Id
    ///
    /// - Parameters:
    ///   - theme: The theme or topic of the match bet.
    ///   - phrase: The specific phrase or question related to the match bet.
    ///   - endRegisterDate: The deadline for users to register for the match bet.
    ///   - endBetDate: The deadline for the actual betting to take place for the match bet.
    ///   - isPublic: Indicates whether the match bet is public or private.
    ///   - status: The current status of the match bet.
    ///   - invited: List of users who are invited to participate in the match bet.
    ///   - author: The user who created the match bet.
    ///   - nameTeam1: The name of the first team involved in the match.
    ///   - nameTeam2: The name of the second team involved in the match.
    public init(theme: String, phrase: String, endRegisterDate: Date, endBetDate: Date, isPrivate: Bool, status: BetStatus, invited: [String], author: String, nameTeam1: String, nameTeam2: String) {
        self.nameTeam1 = nameTeam1
        self.nameTeam2 = nameTeam2
        super.init(theme: theme, phrase: phrase, endRegisterDate: endRegisterDate, endBetDate: endBetDate, isPrivate: isPrivate, status: status, invited: invited, author: author)
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.nameTeam1 = try container.decode(String.self, forKey: .nameTeam1)
        self.nameTeam2 = try container.decode(String.self, forKey: .nameTeam2)
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(nameTeam1, forKey: .nameTeam1)
        try container.encode(nameTeam2, forKey: .nameTeam2)
        try super.encode(to: encoder)
    }
    
}
