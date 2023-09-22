//
//  HomeScreen.swift
//  AllIn
//
//  Created by étudiant on 22/09/2023.
//

import SwiftUI

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
