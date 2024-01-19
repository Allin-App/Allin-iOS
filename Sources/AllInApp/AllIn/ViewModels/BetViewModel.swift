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

    init() {
        getItems()
    }
    
    func getItems() {
        manager.getBets(withIndex: 0, withCount: 20) { bets in
            self.bets = bets
        }
    }
    
    private var cancellables: Set<AnyCancellable> = []
}
