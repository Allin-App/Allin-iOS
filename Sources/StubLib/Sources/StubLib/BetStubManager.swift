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
    
    public func getBets(withIndex index: Int, withCount count: Int) -> [Bet] {
        return Stub.shared.bets
    }
    
    public func getUsers(username: String) -> [User] {
        return Stub.shared.users
            .filter { user in
                user.username.contains(username)
            }
    }
    
}
