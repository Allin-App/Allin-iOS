//
//  CurrentBetViewModel.swift
//  AllIn
//
//  Created by Emre on 31/01/2024.
//

import Foundation
import DependencyInjection
import Model

class CurrentBetViewModel: ObservableObject {
    
    @Inject var manager: Manager
    
    @Published private(set) var bets: [Bet] = []

    init() {
        getItems()
    }
    
    func getItems() {
        manager.getCurrentBets(withIndex: 0, withCount: 20) { bets in
            self.bets = bets
        }
    }
    
}
