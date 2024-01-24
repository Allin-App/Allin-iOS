//
//  FactoryApiBet.swift
//  
//
//  Created by Emre on 11/01/2024.
//

import Foundation
import Model

public class FactoryApiBet: FactoryBet {
    
    func formatZonedDateTime(dateTime: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        formatter.timeZone = TimeZone.current
        return formatter.string(from: dateTime)
    }
    
    public func toResponse(bet: Bet) -> [String: Any] {
        let json: [String: Any] = [
            "theme": bet.theme,
            "sentenceBet": bet.phrase,
            "endRegistration": formatZonedDateTime(dateTime: bet.endRegisterDate),
            "endBet": formatZonedDateTime(dateTime: bet.endBetDate),
            "isPrivate": String(bet.isPublic),
            "response": ["Yes","No"],
        ]
        
        return json
    }
    
    public func fromJsonDateString(_ dateString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        let date = formatter.date(from: dateString)
        return date
    }
    
    public func toBet(from json: [String: Any]) -> Bet? {
        guard let id = json["id"] as? String,
              let theme = json["theme"] as? String,
              let phrase = json["sentenceBet"] as? String,
              let endRegisterDateString = json["endRegistration"] as? String,
              let endBetDateString = json["endBet"] as? String,
              let isPublic = json["isPrivate"] as? Bool,
              let createdBy = json["createdBy"] as? String else {
            return nil
        }
        
        guard let endRegisterDate = fromJsonDateString(endRegisterDateString),
              let endBetDate = fromJsonDateString(endBetDateString) else {
            return nil
        }
        
        return toBet(id: id, theme: theme, description: phrase, endRegister: endRegisterDate, endBet: endBetDate, isPublic: isPublic, status: .FINISHED, creator: User(username: createdBy, email: createdBy, nbCoins: 0, friends: []), type: 0)
    }
    
    public func toBet(id: String, theme: String, description: String, endRegister: Date, endBet: Date, isPublic: Bool, status: BetStatus, creator: User, type: Int) -> Bet {
        switch type {
        case 0:
            return BinaryBet(id: id, theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, isPublic: isPublic, status: status, invited: [], author: creator, registered: [])
        case 1:
            return MatchBet(id: id, theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, isPublic: isPublic, status: status, invited: [], author: creator, registered: [], nameTeam1: "", nameTeam2: "")
        case 2:
            return CustomBet(id: id, theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, isPublic: isPublic, status: status, invited: [], author: creator, registered: [])
        default:
            return BinaryBet(id: id, theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, isPublic: isPublic, status: status, invited: [], author: creator, registered: [])
        }
    }
    
    public func toBetDetail(from json: [String: Any]) -> BetDetail? {
        guard let betJson = json["bet"] as? [String: Any],
              let bet = self.toBet(from: betJson) else {
            return nil
        }
        
        var participations: [Participation] = []
        
        if let participationsJson = json["participations"] as? [[String: Any]], !participationsJson.isEmpty {
            for participationJson in participationsJson {
                if let participation = self.toParticipate(from: participationJson) {
                    participations.append(participation)
                }
            }
        }
        
        return BetDetail(bet: bet, answers: [], participations: participations)
    }
    
    public func toParticipate(from json: [String: Any]) -> Participation? {
        guard let id = json["id"] as? String,
              let betId = json["betId"] as? String,
              let username = json["username"] as? String,
              let answer = json["answer"] as? String,
              let stake = json["stake"] as? Int else {
            return nil
        }
        
        return Participation(id: id, stake: stake, date: Date(), response: answer, user: User(username: username, email: "Email", nbCoins: 0, friends: []), betId: betId)
    }
}
