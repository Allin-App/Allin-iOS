//
//  BetEndingValidationViewModel.swift
//  AllIn
//
//  Created by Emre on 07/02/2024.
//

import Foundation
import DependencyInjection
import Model

class BetEndingValidationViewModel: ObservableObject {
    
    var id: String
    @Inject var manager: Manager
    @Published var selectedAnswer : String?

    init(id: String) {
        self.id = id
    }
    
    func post() {
        if let answer = selectedAnswer {
            manager.addResponse(withIdBet: id, andResponse: answer)
        }
    }
}
