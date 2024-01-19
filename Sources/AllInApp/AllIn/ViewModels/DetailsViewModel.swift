//
//  DetailsViewModel.swift
//  AllIn
//
//  Created by Emre on 16/01/2024.
//

import Foundation
import SwiftUI
import ViewModel
import DependencyInjection

class DetailsViewModel: ObservableObject {
    
    @Inject var manager: ManagerVM
    var id: String
    
    init(id: String) {
        self.id = id
        getItem()
    }
    
    func getItem() {
       
    }
}
