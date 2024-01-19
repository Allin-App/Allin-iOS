//
//  HistoricBetViewModel.swift
//  AllIn
//
//  Created by Emre on 16/01/2024.
//

import Foundation
import SwiftUI
import ViewModel
import DependencyInjection

class HistoricBetViewModel: ObservableObject {
    
    @Inject var manager: ManagerVM
    
    init() {
        getItems()
    }
    
    func getItems() {
       
    }
}
