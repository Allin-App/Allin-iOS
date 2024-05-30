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
    @Published private(set) var requests: [User] = []
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
        getRequests()
    }
    
    func getItems() {
        manager.getFriends() { friends in
            DispatchQueue.main.async {
                self.users = friends
            }
        }
    }
    
    func getRequests() {
        manager.getRequests() { friends in
            DispatchQueue.main.async {
                self.requests = friends
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
    
    func toggleFriendStatus(for user: User, isRequest: Bool) {
        let targetList = isRequest ? requests : users
        
        guard let index = targetList.firstIndex(where: { $0.username == user.username }) else { return }
        var updatedUser = targetList[index]
        
        if isRequest {
            if updatedUser.friendStatus == .requested {
                updatedUser.friendStatus = .notFriend
                deleteItem(username: user.username)
            } else {
                updatedUser.friendStatus = .friend
                addItem(username: user.username)
            }
            requests.remove(at: index)
        } else {
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
    }
    
    func declineRequest(username: String){
        guard let index = requests.firstIndex(where: { $0.username == username }) else { return }
        manager.removeFriend(withUsername: username) { statusCode in
            
        }
        requests.remove(at: index)
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
