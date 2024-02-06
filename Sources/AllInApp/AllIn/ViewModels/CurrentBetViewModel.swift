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
            for bet in bets {
                let betDetail = BetDetail(bet: bet, answers: [AnswerDetail(response: "OUI", totalStakes: 120, totalParticipants: 2, highestStake: 200, odds: 1.2), AnswerDetail(response: "NON", totalStakes: 120, totalParticipants: 2, highestStake: 200, odds: 1.2)], participations: [])
                self.bets.append(betDetail)
            }
        }
    }
    
}
