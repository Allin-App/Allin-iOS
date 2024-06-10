//
//  UserDataManager.swift
//  
//
//  Created by Emre on 29/12/2023.
//

import Foundation

public protocol UserDataManager {
    func getBets(withIndex index: Int, withCount count: Int) -> [Bet]
    func getBetsOver(completion: @escaping ([BetDetail]) -> Void)
    func getBetsWon(completion : @escaping ([BetResultDetail])-> ())
    func addBet(bet: Bet, completion : @escaping (Int)-> ())
    func addFriend(username: String, completion : @escaping (Int)-> ())
    func removeFriend(username: String, completion : @escaping (Int)-> ())
    func getFriends(completion: @escaping ([User]) -> Void)
    func getRequests(completion: @escaping ([User]) -> Void)
    func getUsers(withName name: String, completion: @escaping ([User]) -> Void)
    func getGifts(completion : @escaping (Int, Int)-> ())
    func getOldBets(withIndex index: Int, withCount count: Int, completion: @escaping ([BetResultDetail]) -> Void)
    func getCurrentBets(withIndex index: Int, withCount count: Int, completion: @escaping ([BetDetail]) -> Void)
    func addParticipation(withId id: String, withAnswer answer: String, andStake stake: Int, completion : @escaping (Int)-> ())
    func addResponse(withIdBet id: String, andResponse responseBet: String)
}
