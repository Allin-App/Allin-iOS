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
    
    @Published var popularBet: Bet?
    @Published private(set) var bets: [Bet] = []
    @Published var betsOver: [BetDetail] = []
    @Published var betsWon: [BetResultDetail] = []
    @Published var showingSheetOver: Bool  = false
    @Published var showingSheetWon: Bool  = false
    @Published var filters: Set<BetFilter> = [] {
        didSet {
            getItems()
        }
    }
        
    init() {
        getItems()
        getPopularBet()
        getBetsOver()
    }
    
    func getItems() {
        manager.getBets(withIndex: 0, withCount: 20, filters: Array(filters)) { bets in
            DispatchQueue.main.async {
                self.bets = bets
            }
        }
    }
    
    func getBetsOver() {
        manager.getBetsOver() { bets in
            DispatchQueue.main.async {
                self.betsOver = bets
                if !self.betsOver.isEmpty {
                    self.showingSheetOver = true
                }
            }
        }
    }
    
    func getBetsWon() {
        manager.getBetsWon() { bets in
            DispatchQueue.main.async {
                self.betsWon = bets
                if !self.betsWon.isEmpty {
                    self.showingSheetWon = true
                }
            }
        }
    }
    
    func getPopularBet() {
        manager.getPopularBet() { bet in
            DispatchQueue.main.async {
                self.popularBet = bet
            }
        }
    }
}
