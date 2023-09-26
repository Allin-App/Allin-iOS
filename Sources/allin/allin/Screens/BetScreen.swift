//
//  BetScreen.swift
//  AllIn
//
//  Created by étudiant on 22/09/2023.
//

import SwiftUI

struct Bet: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            TopBarView(showMenu: self.$showMenu)
            ScrollView(showsIndicators: false){
                LazyVStack(alignment: .leading, spacing: 0, pinnedViews: [.sectionHeaders]) {
                    
                    TrendingBetCard().padding(.top,25).padding([.leading,.trailing],25)
                    
                    Section {
                        VStack(spacing: 20){
                            BetCard()
                            BetCard()
                            BetCard()
                        }.padding([.leading,.trailing],25)
                    } header: {
                        ZStack{
                            AllinColor.fadeInGradiantCard
                            ScrollView(.horizontal,showsIndicators: false){
                                HStack{
                                    ChoiceCapsule()
                                    ChoiceCapsule()
                                    ChoiceCapsule()
                                    ChoiceCapsule()
                                    ChoiceCapsule()
                                    ChoiceCapsule()
                                    ChoiceCapsule()
                                }.padding(.leading,25).padding([.top,.bottom],15)
                                
                            }
                        }
                        
                    }
                    
                }
            }
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom).background(AllinColor.backgroundWhite)
    }
    
}
