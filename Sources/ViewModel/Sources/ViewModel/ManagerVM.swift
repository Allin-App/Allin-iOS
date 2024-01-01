//
//  ManagerVM.swift
//  
//
//  Created by Emre on 30/12/2023.
//

import Foundation
import Model

public class ManagerVM: ObservableObject {
    @Published var model: Manager
    
    public init(withModel model: Manager) {
        self.model = model
    }
    
    public func getPublicBets() {
        
    }
    
    public func addBet() {
        
    }
}
