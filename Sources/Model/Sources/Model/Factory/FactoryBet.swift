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
}
