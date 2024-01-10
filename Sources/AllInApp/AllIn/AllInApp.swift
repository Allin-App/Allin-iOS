//
//  AllInApp.swift
//  AllIn
//
//  Created by Emre on 19/09/2023.
//

import SwiftUI
import DependencyInjection
import Model
import ViewModel
import StubLib
import Api

@main
struct AllInApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let DI = DependencyInjection.shared
    
    init() {
        DI.addSingleton(IAuthService.self, AuthService())
        DI.addSingleton(ManagerVM.self, ManagerVM(withModel: Manager(withBetDataManager: BetStubManager(), withUserDataManager: UserApiManager())))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
