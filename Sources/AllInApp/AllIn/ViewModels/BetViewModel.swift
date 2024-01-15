//
//  BetViewModel.swift
//  AllIn
//
//  Created by Emre on 30/12/2023.
//

import Foundation
import DependencyInjection
import ViewModel
import Model
import Combine

class BetViewModel: ObservableObject {
    
    @Inject var manager: ManagerVM
    
    @Published private var internalBets: [Bet] = []
    
    var bets: [Bet] {
        return internalBets
    }

    init() {
        getItems()
    }
    
    func getItems() {
        for bet in manager.bets {
            print(bet.theme)
        }
        manager.$bets.assign(to: \.internalBets, on: self).store(in: &cancellables)
        manager.getPublicBets()        
    }
    
    private var cancellables: Set<AnyCancellable> = []
}
