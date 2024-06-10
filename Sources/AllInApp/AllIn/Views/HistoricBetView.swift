//
//  BetView.swift
//  AllIn
//
//  Created by Lucas on 22/09/2023.
//

import SwiftUI
import Model

struct HistoricBetView: View {
    
    @StateObject private var viewModel = HistoricBetViewModel()
    @Binding var showMenu: Bool
    @State private var showingSheet = false
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            
            TopBar(showMenu: self.$showMenu)
            ScrollView(showsIndicators: false) {
                Text("bet_history_title")
                    .textStyle(weight: .bold, color: AllInColors.grey500Color, size: 25)
                    .padding([.top],15)
                VStack(spacing: 20){
                    ForEach(viewModel.bets, id: \.bet.id) { (betDetail: BetResultDetail) in
                        ReviewCard(bet: betDetail.bet, amount: betDetail.participation.stake, isWin: betDetail.won)
                    }
                }
                .padding([.trailing, .leading, .bottom],25)
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(AllInColors.backgroundColor)
    }
}

