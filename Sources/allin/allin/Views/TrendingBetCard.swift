//
//  TrendingBetCard.swift
//  AllIn
//
//  Created by étudiant on 21/09/2023.
//

import SwiftUI

struct TrendingBetCard: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image("Trending")
                    .resizable()
                    .frame(width: 15, height: 15, alignment: .leading)
                Text("Populaire")
                    .fontWeight(.medium)
                    .foregroundColor(AllinColor.pinkAccentText)
            }.padding([.leading,.top],10)
            Text("Emre va réussir son TP de CI/CD mercredi?")
                .frame(height: 47)
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
                .padding([.leading,.trailing],33)
                .font(.system(size: 17))
            Spacer()
            GeometryReader { geometry in HStack(alignment: .center,spacing: 0){
                Text("12")
                    .fontWeight(.bold)
                    .foregroundColor(AllinColor.pinkAccentText)
                    .font(.system(size: 14))
                Text("joueurs")
                    .fontWeight(.regular)
                    .foregroundColor(Color.white).padding([.leading],2)
                    .font(.system(size: 14))
                Text("2.35k")
                    .fontWeight(.bold)
                    .foregroundColor(AllinColor.pinkAccentText)
                    .padding([.leading],10)
                    .font(.system(size: 14))
                Text("points misés")
                    .fontWeight(.regular)
                    .foregroundColor(Color.white).padding([.leading],2)
                    .font(.system(size: 14))
            }.padding([.leading,.bottom,.trailing],5).frame( width: geometry.size.width,height:geometry.size.height, alignment: .bottom)}
            
            
        }.frame(width: 344, height: 127, alignment: .topLeading).background(AllinColor.darkerGray)
            .clipShape(RoundedRectangle(cornerRadius: 17, style: .continuous))
    }
}

struct TrendingBetCard_Previews: PreviewProvider {
    static var previews: some View {
        TrendingBetCard()
    }
}
