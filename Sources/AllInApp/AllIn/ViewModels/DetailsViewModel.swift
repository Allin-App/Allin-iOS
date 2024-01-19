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
}
