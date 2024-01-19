//
//  RankingViewModel.swift
//  AllIn
//
//  Created by Emre on 30/12/2023.
//

import Foundation
import DependencyInjection
import Model

class RankingViewModel: ObservableObject {
    
    @Inject var manager: Manager
    
    init() {
        getItems()
    }
    
    func getItems ( ) {
       
    }
    
    func deleteItem(indexSet: IndexSet) {

    }
    
    func moveltem(from: IndexSet, to: Int) {
        
    }
    
    func addItem(title: String) {

    }
}
