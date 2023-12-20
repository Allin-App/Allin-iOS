//
//  AppState.swift
//  AllIn
//
//  Created by Emre on 17/12/2023.
//

import SwiftUI

class AppStateContainer: ObservableObject {
    static let shared = AppStateContainer()
    let loggedState: LoggedState = LoggedState()
    var onlineStatus: OnlineStatus = OnlineStatus()
    
    @AppStorage("authenticationRefresh") var authenticationRefresh: String?
}

class LoggedState: ObservableObject {
    @Published var connectedUser: Bool = false
}

class OnlineStatus: ObservableObject {
    @Published var isOnline: Bool = true
}
