//
//  FactoryBet.swift
//  
//
//  Created by Emre on 09/01/2024.
//

import Foundation

public protocol FactoryBet {
    func toResponse(bet: Bet) -> [String: Any]
    func toBet(from json: [String: Any]) -> Bet?
    func toBetDetail(from json: [String: Any]) -> BetDetail?
    func toBet(id: String, theme: String, description: String, endRegister: Date, endBet: Date, isPublic: Bool, status: BetStatus, creator: User, type: String) -> Bet
}
