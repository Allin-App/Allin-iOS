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

class DetailsViewModel: ObservableObject {
    
    @Inject var manager: Manager
    var id: String
    @Published var answer = 0
    @Published var mise: String = ""

    @Published var betDetail: BetDetail?
    
    init(id: String) {
        self.id = id
        getItem(withId: id)
    }
    
    func getItem(withId id: String) {
        manager.getBet(withId: id) { bet in
            self.betDetail = bet
        }
    }
    
    func addParticipate() {
        if let stake = Int(mise) {
            var rep: String = ""
            if answer ==  0 {
                rep = "Yes"
            } else {
                rep = "No"
            }
            manager.addParticipation(withId: id, withAnswer: rep, andStake: stake)
        }
    }
}
