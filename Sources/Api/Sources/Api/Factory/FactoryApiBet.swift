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

        let json: [String: Any] = [
            "id": "1",
            "theme": bet.theme,
            "sentenceBet": bet.phrase,
            "endRegistration": bet.endRegisterDate.timeIntervalSince1970,
            "endBet": bet.endBetDate.timeIntervalSince1970,
            "isPrivate": String(bet.isPublic),
            "response": [],
        ]
        
        return json
    }
    
    public func toModel(from json: [String: Any]) -> Bet? {
        guard let id = json["id"] as? String,
              let theme = json["theme"] as? String,
              let phrase = json["sentenceBet"] as? String,
              let endRegisterDateString = json["endRegistration"] as? String,
              let endBetDateString = json["endBet"] as? String,
              let isPublic = json["isPrivate"] as? Bool,
              let createdBy = json["createdBy"] as? String else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        guard let endRegisterDate = dateFormatter.date(from: endRegisterDateString),
              let endBetDate = dateFormatter.date(from: endBetDateString) else {
            return nil
        }
                
        return toModel(id: id, theme: theme, description: phrase, endRegister: endRegisterDate, endBet: endBetDate, isPublic: isPublic, creator: User(username: createdBy, email: createdBy, nbCoins: 0, friends: []), type: 0)
    }
    
    public func toModel(id: String, theme: String, description: String, endRegister: Date, endBet: Date, isPublic: Bool, creator: User, type: Int) -> Bet {
        switch type {
        case 0:
            return BinaryBet(id: id, theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, totalStakes: 0, isPublic: isPublic, invited: [], author: creator, registered: [])
        case 1:
            return MatchBet(id: id, theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, totalStakes: 0, isPublic: isPublic, invited: [], author: creator, registered: [], nameTeam1: "", nameTeam2: "")
        case 2:
            return CustomBet(id: id, theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, totalStakes: 0, isPublic: isPublic, invited: [], author: creator, registered: [])
        default:
            return BinaryBet(id: id, theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, totalStakes: 0, isPublic: isPublic, invited: [], author: creator, registered: [])
        }
        
    }
}
