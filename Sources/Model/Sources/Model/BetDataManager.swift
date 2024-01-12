//
//  BetDataManager.swift
//  
//
//  Created by Emre on 29/12/2023.
//

import Foundation

public protocol BetDataManager {
    func getBets(withIndex index: Int, withCount count: Int, completion: @escaping ([Bet]) -> Void)
    func getUsers(username: String) -> [User]
}
