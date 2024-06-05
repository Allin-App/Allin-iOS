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
    
    @Published private(set) var friends: [User] = []

    init() {
        getItems()
    }
    
    func getItems() {
        manager.getFriends() { users in
            var friends = users
            friends.append(AppStateContainer.shared.user!)
            DispatchQueue.main.async {
                self.friends = friends.sorted(by: { $0.nbCoins > $1.nbCoins })
            }
        }
    }
}
