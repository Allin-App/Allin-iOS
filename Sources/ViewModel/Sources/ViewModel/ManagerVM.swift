//
//  ManagerVM.swift
//  
//
//  Created by Emre on 30/12/2023.
//

import Foundation
import Model

public class ManagerVM: ObservableObject {
    
    @Published var model: Manager
    @Published public var bets: [Bet] = []
    @Published public var bet: Bet?
    
    public init(withModel model: Manager) {
        self.model = model
    }
    
    public func getPublicBets() {
        model.getBets(withIndex: 0, withCount: 20) { bets in
            self.bets = bets
        }
    }
    
    public func addBet(theme: String, description: String, endRegister: Date, endBet: Date, isPublic: Bool, creator: User) {
        model.addBet(bet: BinaryBet(theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, totalStakes: 0, isPublic: isPublic, invited: [], author: creator, registered: []))
    }
    
    public func getBet(withId id: String) {
        model.getBet(withId: id) { bet in
            self.bet = bet
        }
    }
    
    public func getHistoricBets() {
        model.getHistoricBets(withIndex: 0, withCount: 20) { bets in
            self.bets = bets
        }
    }
    
}
