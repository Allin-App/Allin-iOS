//
//  ContentView.swift
//  AllIn
//
//  Created by Emre on 19/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @Inject var authService: IAuthService
    @ObservedObject var loggedState = AppStateContainer.shared.loggedState
    
    var body: some View {
        VStack {
            NavigationView {
                if loggedState.connectedUser {
                    MainView(page: "Bet")
                } else {
                    WelcomeView()
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
        .onAppear {
            //authService.refreshAuthentication() { status in }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
