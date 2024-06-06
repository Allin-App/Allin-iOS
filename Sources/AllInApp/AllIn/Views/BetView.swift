//
//  BetView.swift
//  AllIn
//
//  Created by Lucas on 22/09/2023.
//

import SwiftUI
import Model

struct BetView: View {
    
    @StateObject private var viewModel = BetViewModel()
    @Binding var showMenu: Bool
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            TopBar(showMenu: self.$showMenu)
            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .center, spacing: 0, pinnedViews: [.sectionHeaders]) {
                    
                    if let bet = viewModel.popularBet {
                        TrendingBetCard(bet: bet)
                            .padding(.top,25)
                            .padding([.leading,.trailing],25)
                    }
                    
                    Section {
                        VStack(spacing: 20){
                            if(viewModel.bets.isEmpty){
                                EmptyInfo(emoji:"🎮", title: String(localized: "empty_bets_title"), explain: "")
                            }
                            else{
                                ForEach(viewModel.bets, id: \.id) { (bet: Bet) in
                                    BetCard(bet: bet)
                                }
                            }
                        }
                        .padding([.leading,.trailing],25)
                        
                    } header: {
                        ZStack{
                            AllInColors.fadeInGradiantCard
                            ScrollView(.horizontal,showsIndicators: false){
                                HStack{
                                    ChoiceCapsule(filter: .isPublic, viewModel: viewModel)
                                    ChoiceCapsule(filter: .isInvitation, viewModel: viewModel)
                                    ChoiceCapsule(filter: .inProgress, viewModel: viewModel)
                                    ChoiceCapsule(filter: .isFinished, viewModel: viewModel)
                                }
                                .padding(.leading,25)
                                .padding([.top,.bottom],15)
                            }
                        }
                    }
                }
            }
            .refreshable {
                viewModel.getItems()
            }
            .sheet(isPresented: $viewModel.showingSheetOver, onDismiss: {
                viewModel.betsOver.removeFirst()
                viewModel.showingSheetOver = !viewModel.betsOver.isEmpty
            }) {
                if let firstBetDetail = viewModel.betsOver.first {
                    BetEndingValidationView(bet: firstBetDetail)
                }
            }
            .sheet(isPresented: $viewModel.showingSheetWon, onDismiss: {
                viewModel.betsWon.removeFirst()
                viewModel.showingSheetWon = !viewModel.betsWon.isEmpty
            }) {
                if let firstBetResultDetail = viewModel.betsWon.first {
                    WinModal()
                }
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(AllInColors.backgroundColor)
    }
}
