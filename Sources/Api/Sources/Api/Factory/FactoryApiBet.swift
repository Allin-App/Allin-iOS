//
//  FactoryApiBet.swift
//  
//
//  Created by Emre on 11/01/2024.
//

import Foundation
import Model

public class FactoryApiBet: FactoryBet {
    
    public func toResponse(bet: Bet) -> [String: Any] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let json: [String: Any] = [
            "theme": bet.theme,
            "sentenceBet": bet.phrase,
            "endRegistration": dateFormatter.string(from: bet.endRegisterDate),
            "endBet": dateFormatter.string(from: bet.endBetDate),
            "isPrivate": String(bet.isPublic),
            "response": [],
        ]
        
        return json
    }
    
    public func toModel(from json: [String: Any]) -> Bet? {
        guard let theme = json["theme"] as? String,
              let phrase = json["sentenceBet"] as? String,
              let endRegisterDateString = json["endRegistration"] as? String,
              let endBetDateString = json["endBet"] as? String,
              let isPublicString = json["isPrivate"] as? String,
              let createdBy = json["createdBy"] as? User, // Assuming User object can be parsed from JSON
              let type = json["type"] as? Int else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        guard let endRegisterDate = dateFormatter.date(from: endRegisterDateString),
              let endBetDate = dateFormatter.date(from: endBetDateString) else {
            return nil
        }
        
        let isPublic = (isPublicString.lowercased() == "true")
        
        return toModel(theme: theme, description: phrase, endRegister: endRegisterDate, endBet: endBetDate, isPublic: isPublic, creator: createdBy, type: type)
    }
    
    public func toModel(theme: String, description: String, endRegister: Date, endBet: Date, isPublic: Bool, creator: User, type: Int) -> Bet {
        switch type {
        case 0:
            return BinaryBet(theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, totalStakes: 0, isPublic: isPublic, invited: [], author: creator, registered: [])
        case 1:
            return MatchBet(theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, totalStakes: 0, isPublic: isPublic, invited: [], author: creator, registered: [], nameTeam1: "", nameTeam2: "")
        case 2:
            return CustomBet(theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, totalStakes: 0, isPublic: isPublic, invited: [], author: creator, registered: [])
        default:
            return BinaryBet(theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, totalStakes: 0, isPublic: isPublic, invited: [], author: creator, registered: [])
        }
        
    }
}
