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
    @State var showingSheet: Bool  = false
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            TopBar(showMenu: self.$showMenu)
            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .leading, spacing: 0, pinnedViews: [.sectionHeaders]) {
                    
                    TrendingBetCard().padding(.top,25).padding([.leading,.trailing],25)
                    
                    Section {
                        VStack(spacing: 20){
                            ForEach(viewModel.bets, id: \.id) { (bet: Bet) in
                                BetCard(bet: bet)
                            }
                            Button("Show Sheet") {
                                showingSheet.toggle()
                            }
                        }
                        .padding([.leading,.trailing],25)
                        
                    } header: {
                        ZStack{
                            AllInColors.fadeInGradiantCard
                            ScrollView(.horizontal,showsIndicators: false){
                                HStack{
                                    ChoiceCapsule()
                                    ChoiceCapsule()
                                    ChoiceCapsule()
                                    ChoiceCapsule()
                                    ChoiceCapsule()
                                    ChoiceCapsule()
                                    ChoiceCapsule()
                                }
                                .padding(.leading,25)
                                .padding([.top,.bottom],15)
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $showingSheet) {
                WinModal()
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(AllInColors.backgroundColor)
        
    }
}


struct BetView_Previews: PreviewProvider {
    static var previews: some View {
        BetView(showMenu: .constant(false))
            .preferredColorScheme(.light)
    }
}
