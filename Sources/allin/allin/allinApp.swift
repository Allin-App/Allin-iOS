//
//  AllInApp.swift
//  AllIn
//
//  Created by Emre on 19/09/2023.
//

import SwiftUI

@main
struct AllInApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let DI = DependencyInjection.shared
    
    init() {
        DI.addSingleton(IAuthService.self, AuthService())
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
