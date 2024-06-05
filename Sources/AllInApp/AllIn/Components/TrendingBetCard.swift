//
//  TrendingBetCard.swift
//  AllIn
//
//  Created by Lucas on 21/09/2023.
//

import SwiftUI
import Model

struct TrendingBetCard: View {
    
    var bet: Bet
    @State var showDetails: Bool = false
    @State var showParticipate: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("FireIcon")
                    .resizable()
                    .frame(width: 15, height: 15, alignment: .leading)
                
                Text("bet_popular")
                    .textStyle(weight: .medium, color: AllInColors.pinkAccentColor, size: 17)
            }
            .padding([.leading, .top], 10)
            
            Text(bet.theme)
                .textStyle(weight: .heavy, color: .white, size: 17)
                .frame(height: 47)
                .multilineTextAlignment(.leading)
                .padding([.leading, .trailing], 33)
            
            Spacer()
            
            GeometryReader { geometry in
                HStack(alignment: .center, spacing: 0) {
                    Text("12")
                        .textStyle(weight: .bold, color: AllInColors.pinkAccentColor, size: 14)
                    
                    Text("bet_players_format")
                        .textStyle(weight: .regular, color: .white, size: 14)
                        .padding([.leading], 2)
                    
                    Text("2.35k")
                        .textStyle(weight: .bold, color: AllInColors.pinkAccentColor, size: 14)
                        .padding([.leading], 10)
                    
                    Text("bet_points_at_stake_format")
                        .textStyle(weight: .regular, color: .white, size: 14)
                        .padding([.leading], 2)
                }
                .padding([.leading, .bottom, .trailing], 10)
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottom)
            }
        }
        .frame(height: 127, alignment: .topLeading)
        .background(AllInColors.primaryColor)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(AllInColors.primaryGradient, lineWidth: 5)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .onTapGesture {
            showDetails.toggle()
        }
        .fullScreenCover(isPresented: $showDetails) {
            DetailsView(isModalPresented: $showDetails, isModalParticipated: $showParticipate, id: bet.id)
        }
    }
}

struct TrendingBetCard_Previews: PreviewProvider {
    static var previews: some View {
        TrendingBetCard(bet: BinaryBet(theme: "Football - Finale de la Ligue des Champions",
                                       phrase: "Le gagnant de la finale sera l'équipe avec le plus de tirs au but.",
                                       endRegisterDate: Date().addingTimeInterval(86400),
                                       endBetDate: Date().addingTimeInterval(172800),
                                       isPublic: true,
                                       status: .inProgress,
                                       invited: [],
                                       author: "Imri",
                                       registered: []))
    }
}
