//
//  HistoricBetViewModel.swift
//  AllIn
//
//  Created by Emre on 16/01/2024.
//

import Foundation
import DependencyInjection
import Model

class HistoricBetViewModel: ObservableObject {
    
    @Inject var manager: Manager

    @Published private(set) var bets: [BetDetail] = []

    init() {
        getItems()
    }
    
    func getItems() {
        manager.getHistoricBets(withIndex: 0, withCount: 20) { bets in
            self.bets = bets
        }
    }
}
