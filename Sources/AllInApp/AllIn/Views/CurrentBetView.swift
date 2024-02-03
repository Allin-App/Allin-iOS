//
//  CurrentBetView.swift
//  AllIn
//
//  Created by Emre on 31/01/2024.
//

import SwiftUI
import Model
import StubLib

struct CurrentBetView: View {
    
    @StateObject private var viewModel = CurrentBetViewModel()
    @Binding var showMenu: Bool
    @State private var showingSheet = false
    var betD: BetDetail = BetStubManager().getABetDetail()

    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            
            TopBar(showMenu: self.$showMenu)
            ScrollView(showsIndicators: false) {
                Text("En cours")
                    .textStyle(weight: .bold, color: AllInColors.grey500Color, size: 25)
                    .padding([.top],15)
                VStack(spacing: 20){
                    ForEach(viewModel.bets, id: \.id) { (bet: Bet) in
                        ReviewCard(betDetail: betD, amountBetted: 110, isAWin: false)
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

