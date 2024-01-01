//
//  FriendsViewModel.swift
//  AllIn
//
//  Created by Emre on 30/12/2023.
//

import Foundation
import DependencyInjection
import ViewModel

class FriendsViewModel: ObservableObject {
    
    @Inject var manager: ManagerVM
    
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
