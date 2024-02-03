//
//  BetView.swift
//  AllIn
//
//  Created by Lucas on 22/09/2023.
//

import SwiftUI

struct HistoricBetView: View {
    
    @StateObject private var viewModel = BetViewModel()
    @Binding var showMenu: Bool
    @State private var showingSheet = false
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            
            TopBar(showMenu: self.$showMenu)
            ScrollView(showsIndicators: false) {
                Text("Historique")
                    .textStyle(weight: .bold, color: AllInColors.grey500Color, size: 25)
                    .padding([.top],15)
                VStack(spacing: 20){
//                    ReviewCard(amountBetted: 110, isAWin: true)
//                    ReviewCard(amountBetted: 3, isAWin: false)
                }
                .padding([.trailing, .leading, .bottom],25)
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(AllInColors.backgroundColor)
    }
}

