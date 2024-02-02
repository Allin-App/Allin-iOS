//
//  ContentView.swift
//  AllIn
//
//  Created by Emre on 19/09/2023.
//

import SwiftUI
import DependencyInjection

struct ContentView: View {
    
    @State private var show = true
    @Inject var authService: IAuthService
    @ObservedObject var loggedState = AppStateContainer.shared.loggedState
    
    var body: some View {
        VStack {
            if loggedState.connectedUser {
                NavigationView {
                    MainView(page: "Bet")
                }
                .navigationViewStyle(StackNavigationViewStyle())
            } else {
                NavigationView {
                    WelcomeView()
                }
                .navigationViewStyle(StackNavigationViewStyle())
            }
        }
        .onAppear {
            authService.refreshAuthentication()
        }
        .overlay(
            Group {
                if show {
                    DailyGiftPage(show: $show)
                }
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
