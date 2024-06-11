//
//  DetailsViewModel.swift
//  AllIn
//
//  Created by Emre on 16/01/2024.
//

import Foundation
import SwiftUI
import DependencyInjection
import Model
import WidgetKit

class DetailsViewModel: ObservableObject {
    
    @Inject var manager: Manager
    var id: String
    @Published var selectedAnswer = AnswerDetail(response: "", totalStakes: 0, totalParticipants: 0, highestStake: 0, odds: 0)
    @Published var mise: String = ""
    
    @Published var betDetail: BetDetail?
    
    init(id: String) {
        self.id = id
        getItem(withId: id)
    }
    
    func getItem(withId id: String) {
        manager.getBet(withId: id) { bet in
            DispatchQueue.main.async {
                self.betDetail = bet
                if let firstAnswer = bet.answers.first {
                    self.selectedAnswer = firstAnswer
                }
            }
        }
    }
    
    func addParticipate() {
        if let stake = Int(mise) {
            manager.addParticipation(withId: id, withAnswer: selectedAnswer.response, andStake: stake) { statusCode in
                switch statusCode {
                case 201:
                    AppStateContainer.shared.user?.nbCoins -= stake
                    WidgetCenter.shared.reloadAllTimelines()
                    
                    self.getItem(withId: self.id)
                default:
                    break
                }
            }
        }
        mise = ""
        if let firstAnswer = betDetail!.answers.first {
            self.selectedAnswer = firstAnswer
        }
    }
    
    func checkAndSetError() -> Bool {
        if let stake = Int(mise) {
            if stake <= AppStateContainer.shared.user?.nbCoins ?? 0 && stake > 0 {
                return false
            } else {
                return true
            }
        } else {
            return true
        }
    }
}
