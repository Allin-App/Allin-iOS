//
//  UserStubManager.swift
//  
//
//  Created by Emre on 31/12/2023.
//

import Foundation
import Model

public struct UserStubManager: UserDataManager {
    
    private var username: String
    
    public init(username: String) {
        self.username = username
    }
    
    public func getBets(withIndex index: Int, withCount count: Int) -> [Bet] {
        return Stub.shared.bets.filter { bet in
            bet.registered.contains { user in
                user.username == self.username
            }
        }
    }
    
    public func addBet(bet: Bet) {
        Stub.shared.add(bet: bet)
    }
    
    public func getFriends() -> [User] {
        return Stub.shared.users.filter { user in
            user.friends.contains { friend in
                friend.username == self.username
            }
        }
    }
}
