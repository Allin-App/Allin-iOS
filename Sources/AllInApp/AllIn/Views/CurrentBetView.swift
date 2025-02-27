//
//  CurrentBetView.swift
//  AllIn
//
//  Created by Emre on 31/01/2024.
//

import SwiftUI
import Model

struct CurrentBetView: View {
    
    @StateObject private var viewModel = CurrentBetViewModel()
    @Binding var showMenu: Bool
    @State private var showingSheet = false

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            TopBar(showMenu: self.$showMenu)
            ScrollView(showsIndicators: false) {
                Text("bet_history_current_title")
                    .textStyle(weight: .bold, color: AllInColors.grey500Color, size: 25)
                    .padding([.top],15)
                VStack(spacing: 20){
                    ForEach(viewModel.bets, id: \.bet.id) { (betDetail: BetDetail) in
                        ReviewCard(bet: betDetail.bet, amount: betDetail.userParticipation?.stake ?? 0, isWin: false)
                    }
                }
                .padding([.trailing, .leading, .bottom],25)
            }
            .refreshable {
                viewModel.getItems()
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(AllInColors.backgroundColor)
    }
}

