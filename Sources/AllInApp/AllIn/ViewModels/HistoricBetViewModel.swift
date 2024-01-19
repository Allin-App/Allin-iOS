//
//  HistoricBetViewModel.swift
//  AllIn
//
//  Created by Emre on 16/01/2024.
//

import Foundation
import SwiftUI
import DependencyInjection
import Model

class HistoricBetViewModel: ObservableObject {
    
    @Inject var manager: Manager
    
    init() {
        getItems()
    }
    
    func getItems() {
       
    }
}
