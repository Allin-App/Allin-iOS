//
//  BetViewModel.swift
//  AllIn
//
//  Created by Emre on 30/12/2023.
//

import Foundation
import DependencyInjection
import Model
import Combine

class BetViewModel: ObservableObject {
    
    @Inject var manager: Manager
    
    @Published private(set) var bets: [Bet] = []
    @Published var betsOver: [BetDetail] = []
    @Published var showingSheet: Bool  = false
    @Published var filters: Set<BetFilter> = [] {
        didSet {
            getItems()
        }
    }
        
    init() {
        getItems()
    }
    
    func getItems() {
        manager.getBets(withIndex: 0, withCount: 20, filters: Array(filters)) { bets in
            DispatchQueue.main.async {
                self.bets = bets
            }
        }
        manager.getBetsOver() { bets in
            DispatchQueue.main.async {
                self.betsOver = bets
                if !self.betsOver.isEmpty {
                    self.showingSheet = true
                }
            }
        }
    }
}
