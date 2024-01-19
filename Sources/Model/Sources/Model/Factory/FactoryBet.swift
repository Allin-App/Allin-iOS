//
//  FactoryBet.swift
//  
//
//  Created by Emre on 09/01/2024.
//

import Foundation

public protocol FactoryBet {
    func toResponse(bet: Bet) -> [String: Any]
    func toModel(from json: [String: Any]) -> Bet?
    func toModel(id: String, theme: String, description: String, endRegister: Date, endBet: Date, isPublic: Bool, creator: User, type: Int) -> Bet
}
