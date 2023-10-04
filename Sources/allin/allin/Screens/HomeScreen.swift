//
//  HomeScreen.swift
//  AllIn
//
//  Created by étudiant on 26/09/2023.
//

import SwiftUI

struct Home: View {
    
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
                        Bet(showMenu: self.$showMenu)
                        
                    case "Ranking":
                        Ranking(showMenu: self.$showMenu)
                        
                    case "Friends":
                        Friends(showMenu: self.$showMenu)
                        
                    case "CreationBet":
                        CreationBet(showMenu: self.$showMenu)
                        
                    default:
                        Bet(showMenu: self.$showMenu)
                    }
                }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: self.showMenu ? geometry.size.width/1.21:0)
                    .gesture(openDrag)
                
                if self.showMenu {
                    MenuView()
                        .frame(width: geometry.size.width*0.83)
                        .transition(.move(edge: .leading))
                }
            }
            .gesture(closeDrag)
        }
    }
}
