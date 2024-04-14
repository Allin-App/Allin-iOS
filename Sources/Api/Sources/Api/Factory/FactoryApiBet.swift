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
            "type": betTypeString(fromType: String(describing: type(of: bet)))
        ]
        
        return json
    }
    
    public func toBet(from json: [String: Any]) -> Bet? {
        guard let type = json["type"] as? String, let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []) else {
            return nil
        }
        let decoder = JSONDecoder()
        do {
            switch type {
            case "BINARY":
                return try decoder.decode(BinaryBet.self, from: jsonData)
            case "MATCH":
                return try decoder.decode(MatchBet.self, from: jsonData)
            case "CUSTOM":
                return try decoder.decode(CustomBet.self, from: jsonData)
            default:
                return try decoder.decode(BinaryBet.self, from: jsonData)
            }
        } catch {
            print("Error decoding Bet object: \(error)")
            return nil
        }
    }
    
    public func toBetDetail(from json: [String: Any]) -> BetDetail? {
        guard let betJson = json["bet"] as? [String: Any],
              let bet = self.toBet(from: betJson) else {
            return nil
        }
        
        var participations: [Participation] = []
        
        if let participationsJson = json["participations"] as? [[String: Any]] {
            do {
                participations = try JSONDecoder().decode([Participation].self, from: JSONSerialization.data(withJSONObject: participationsJson))
            } catch {
                print("Error decoding participations: \(error)")
            }
        }
        
        var answers: [AnswerDetail] = []
        
        if let answersJson = json["answers"] as? [[String: Any]] {
            do {
                answers = try JSONDecoder().decode([AnswerDetail].self, from: JSONSerialization.data(withJSONObject: answersJson))
            } catch {
                print("Error decoding answers: \(error)")
            }
        }
        
        return BetDetail(bet: bet, answers: answers, participations: participations)
    }
    
    public func betTypeString(fromType type: String) -> String {
        switch type {
        case "BinaryBet":
            return "BINARY"
        case "MatchBet":
            return "MATCH"
        case "CustomBet":
            return "CUSTOM"
        default:
            return "CUSTOM"
        }
    }
}
