//
//  FriendsViewModel.swift
//  AllIn
//
//  Created by Emre on 30/12/2023.
//

import Foundation
import DependencyInjection
import Model

class FriendsViewModel: ObservableObject {
    
    @Inject var manager: Manager
    
    @Published private(set) var users: [User] = []
    @Published var text: String = "" {
        didSet {
            if text.isEmpty {
                getItems()
            } else {
                search()
            }
        }
    }
    
    init() {
        getItems()
    }
    
    func getItems() {
        manager.getFriends() { friends in
            DispatchQueue.main.async {
                self.users = friends
            }
        }
    }
    
    func search() {
        guard text.allSatisfy({ $0.isLetter || $0.isNumber }) else {
            return
        }
        
        manager.getUsers(withName: text) { users in
            self.users = users
        }
    }
    
    func toggleFriendStatus(for user: User) {
        guard let index = users.firstIndex(where: { $0.username == user.username }) else { return }
        var updatedUser = users[index]
        
        switch updatedUser.friendStatus {
        case .friend:
            updatedUser.friendStatus = .notFriend
            deleteItem(username: user.username)
        case .notFriend:
            updatedUser.friendStatus = .requested
            addItem(username: user.username)
        case .requested:
            updatedUser.friendStatus = .notFriend
            deleteItem(username: user.username)
        default:
            break
        }
        
        users[index] = updatedUser
    }
    
    func deleteItem(username: String) {
        manager.removeFriend(withUsername: username) { statusCode in
            
        }
    }
    
    func addItem(username: String) {
        manager.addFriend(withUsername: username) { statusCode in
            
        }
    }
}
