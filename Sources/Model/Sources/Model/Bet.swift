//
//  Bet.swift
//
//
//  Created by Emre on 28/12/2023.
//

import Foundation

/// A class representing a betting entity, including details about the bet theme, participants, and deadlines.
public class Bet: ObservableObject, Codable {
    
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
    public private(set) var isPrivate: Bool
    
    /// The current status of the bet.
    public private(set) var status: BetStatus
    
    /// List of users who are invited to participate in the bet.
    public private(set) var invited: [String] = []
    
    /// The user who created the bet.
    public private(set) var author: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case theme
        case phrase = "sentenceBet"
        case endRegisterDate = "endRegistration"
        case endBetDate = "endBet"
        case isPrivate = "isPrivate"
        case status
        case author = "createdBy"
    }
    
    public required init(from decoder: Decoder) throws {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.theme = try container.decode(String.self, forKey: .theme)
        self.phrase = try container.decode(String.self, forKey: .phrase)
        let endRegisterDateString = try container.decode(String.self, forKey: .endRegisterDate)
        self.endRegisterDate = formatter.date(from: endRegisterDateString)!
        let endBetDateString = try container.decode(String.self, forKey: .endBetDate)
        self.endBetDate = formatter.date(from: endBetDateString)!
        self.isPrivate = try container.decode(Bool.self, forKey: .isPrivate)
        self.status = try container.decode(BetStatus.self, forKey: .status)
        self.author = try container.decode(String.self, forKey: .author)
    }
    
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
    public init(id: String, theme: String, phrase: String, endRegisterDate: Date, endBetDate: Date, isPrivate: Bool, status: BetStatus, invited: [String], author: String) {
        self.id = id
        self.theme = theme
        self.phrase = phrase
        self.endRegisterDate = endRegisterDate
        self.endBetDate = endBetDate
        self.isPrivate = isPrivate
        self.status = status
        self.invited = invited
        self.author = author
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
    public init(theme: String, phrase: String, endRegisterDate: Date, endBetDate: Date, isPrivate: Bool, status: BetStatus, invited: [String], author: String) {
        self.id = UUID().uuidString
        self.theme = theme
        self.phrase = phrase
        self.endRegisterDate = endRegisterDate
        self.endBetDate = endBetDate
        self.isPrivate = isPrivate
        self.status = status
        self.invited = invited
        self.author = author
    }
    
    /// Function that returns an empty list of responses
    ///
    /// - Returns: An empty list of responses
    public func getResponses() -> [String] {
        return []
    }
    
}
