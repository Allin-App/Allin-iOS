//
//  ContentView.swift
//  AllIn
//
//  Created by Emre on 19/09/2023.
//

import SwiftUI
import DependencyInjection
import Model

struct ContentView: View {
    
    @State private var show = false
    @State private var gain = 0
    @Inject var authService: IAuthService
    @Inject var manager: Manager
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
        .onChange(of: loggedState.connectedUser) { _ in
            if loggedState.connectedUser {
                manager.getTodayGifts() { status, gained in
                    if status == 200 {
                        withAnimation {
                            show = true
                            gain = gained
                        }
                    }
                }
            }
        }
        .overlay(
            Group {
                if show {
                    DailyGiftPage(show: $show, gain: $gain)
                        .transition(.opacity)
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
