//
//  Manager.swift
//  
//
//  Created by Emre on 29/12/2023.
//

import Foundation

public struct Manager {
    let betDataManager: BetDataManager
    let userDataManager: UserDataManager
    
    public init(withBetDataManager betDataManager: BetDataManager, withUserDataManager userDataManager: UserDataManager){
        self.betDataManager = betDataManager
        self.userDataManager = userDataManager
    }
    
    public func addBet(bet: Bet) {
        userDataManager.addBet(bet: bet)
    }
    
    public func getBets(withIndex index: Int, withCount count: Int, completion: @escaping ([Bet]) -> Void) {
        betDataManager.getBets(withIndex: index, withCount: count) { bets in
            completion(bets)
        }
    }
    
    public func getBet(withId id: String, completion: @escaping (Bet) -> Void) {
        betDataManager.getBet(withId: id) { bet in
            completion(bet)
        }
    }
    
    public func getHistoricBets(withIndex index: Int, withCount count: Int, completion: @escaping ([Bet]) -> Void) {
        userDataManager.getOldBets(withIndex: index, withCount: count) { bets in
            completion(bets)
        }
    }
}
