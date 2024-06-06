//
//  MainView.swift
//  AllIn
//
//  Created by Emre on 26/09/2023.
//

import SwiftUI

struct MainView: View {
    
    @State var showMenu = false

    var page: String
    
    var body: some View {
        
        let closeDrag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation{
                        self.showMenu = false
                    }
                }
            }
        let openDrag = DragGesture()
            .onEnded {
                if $0.translation.width > 100 {
                    withAnimation{
                        self.showMenu = true
                    }
                }
            }
        
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Group{
                    switch page {
                    case "Bet":
                        BetView(showMenu: self.$showMenu)
                    case "Historic":
                        HistoricBetView(showMenu: self.$showMenu)
                    case "Ranking":
                        RankingView(showMenu: self.$showMenu)
                    case "Friends":
                        FriendsView(showMenu: self.$showMenu)
                    case "CreationBet":
                        CreationBetView(showMenu: self.$showMenu)
                    case "Current":
                        CurrentBetView(showMenu: self.$showMenu)
                    case "Profile":
                        ProfileView(showMenu: self.$showMenu)
                    default:
                        BetView(showMenu: self.$showMenu)
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .offset(x: self.showMenu ? geometry.size.width/1.21:0)
                .gesture(openDrag)
                
                if self.showMenu {
                    Menu()
                        .transition(.move(edge: .leading))
                        .frame(width: geometry.size.width*0.83)
                }
                
            }
            .gesture(closeDrag)
        }
    }
}
