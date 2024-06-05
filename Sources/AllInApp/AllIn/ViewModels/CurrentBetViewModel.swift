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

    @Published private(set) var bets: [BetDetail] = []

    init() {
        getItems()
    }
    
    func getItems() {
        manager.getCurrentBets(withIndex: 0, withCount: 20) { bets in
            DispatchQueue.main.async {
                self.bets = bets
            }
        }
    }
    
}
