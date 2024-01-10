//
//  BetDataManager.swift
//  
//
//  Created by Emre on 29/12/2023.
//

import Foundation

public protocol BetDataManager {
    func getBets(withIndex index: Int, withCount count: Int) -> [Bet]
    func getUsers(username: String) -> [User]
}
