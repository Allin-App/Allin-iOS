//
//  AllInApp.swift
//  AllIn
//
//  Created by Emre KARTAL on 19/09/2023.
//

import SwiftUI

@main
struct AllInApp: App {
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
