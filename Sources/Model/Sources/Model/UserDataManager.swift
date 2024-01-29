//
//  UserDataManager.swift
//  
//
//  Created by Emre on 29/12/2023.
//

import Foundation

public protocol UserDataManager {
    func getBets(withIndex index: Int, withCount count: Int) -> [Bet]
    func addBet(bet: Bet, completion : @escaping (Int)-> ())
    func getFriends() -> [User]
    func getOldBets(withIndex index: Int, withCount count: Int, completion: @escaping ([Bet]) -> Void)
    func addParticipation(withId id: String, withAnswer answer: String, andStake stake: Int, completion : @escaping (Int)-> ())
}
