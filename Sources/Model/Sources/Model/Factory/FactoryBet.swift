//
//  FactoryBet.swift
//  
//
//  Created by Emre on 09/01/2024.
//

import Foundation

public protocol FactoryBet {
    func toResponse()
    func toModel() -> Bet
    func toModel(theme: String, description: String, endRegister: Date, endBet: Date, isPublic: Bool, creator: User, type: Int) -> Bet
}
