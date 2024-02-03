//
//  BetStubManager.swift
//
//
//  Created by Emre on 31/12/2023.
//

import Foundation
import Model

public struct BetStubManager: BetDataManager {
    
    public init() {}
    
    public func getBets(withIndex index: Int, withCount count: Int, completion: @escaping ([Bet]) -> Void) {
        completion(Stub.shared.bets)
    }
    
    public func getUsers(username: String) -> [User] {
        return []
    }
    
    public func getBet(withId id: String, completion: @escaping (BetDetail) -> Void) {

        if let betDetail = Stub.shared.betsDetail.first(where: { $0.bet.id == id }) {
            completion(betDetail)
        } else {
            print("BetDetail with ID \(id) not found.")
        }
    }
    
    public func getABetDetail() -> BetDetail{
        Stub.shared.betsDetail.first!
    }
    
}
