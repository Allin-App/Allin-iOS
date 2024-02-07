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
    
    public func addBet(bet: Bet, completion : @escaping (Int)-> ()) {
        userDataManager.addBet(bet: bet) { status in
            completion(status)
        }
    }
    
    public func getBets(withIndex index: Int, withCount count: Int, completion: @escaping ([Bet]) -> Void) {
        betDataManager.getBets(withIndex: index, withCount: count) { bets in
            completion(bets)
        }
    }
    
    public func getBetsOver(completion: @escaping ([BetDetail]) -> Void) {
        userDataManager.getBetsOver() { bets in
            completion(bets)
        }
    }
    
    public func getBet(withId id: String, completion: @escaping (BetDetail) -> Void) {
        betDataManager.getBet(withId: id) { bet in
            completion(bet)
        }
    }
    
    public func getHistoricBets(withIndex index: Int, withCount count: Int, completion: @escaping ([Bet]) -> Void) {
        userDataManager.getOldBets(withIndex: index, withCount: count) { bets in
            completion(bets)
        }
    }
    
    public func getCurrentBets(withIndex index: Int, withCount count: Int, completion: @escaping ([Bet]) -> Void) {
        userDataManager.getCurrentBets(withIndex: index, withCount: count) { bets in
            completion(bets)
        }
    }
    
    public func addParticipation(withId id: String, withAnswer answer: String, andStake stake: Int, completion : @escaping (Int)-> ()) {
        userDataManager.addParticipation(withId: id, withAnswer: answer, andStake: stake) { status in
            completion(status)
        }
    }
    
    public func addResponse(withIdBet id: String, andResponse response: String) {
        userDataManager.addResponse(withIdBet: id, andResponse: response)
    }
    
    public func getTodayGifts(completion : @escaping (Int, Int)-> ()) {
        userDataManager.getGifts() { status, gain in
            completion(status, gain)
        }
    }
}
