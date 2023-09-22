//
//  ContentView.swift
//  AllIn
//
//  Created by Emre KARTAL on 19/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var showMenu = false
    
    var body: some View {
        
        let closeDrag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation{
                        self.showMenu = false
                    }
                }
            }
        
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Home(showMenu: self.$showMenu)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: self.showMenu ? geometry.size.width/1.25:0)
                if self.showMenu {
                    MenuView()
                        .frame(width: geometry.size.width*0.8)
                        .transition(.move(edge: .leading))
                }
            }
            .gesture(closeDrag)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            TopBarView(showMenu: self.$showMenu)
            ScrollView{
                TrendingBetCard()
            }
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
}
