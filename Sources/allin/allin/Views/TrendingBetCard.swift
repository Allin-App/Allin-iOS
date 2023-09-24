//
//  TrendingBetCard.swift
//  AllIn
//
//  Created by étudiant on 21/09/2023.
//

import SwiftUI

// Define a custom view modifier for text styling
struct BetText: ViewModifier {
    var weight: Font.Weight
    var color: Color
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .fontWeight(weight)
            .foregroundColor(color)
            .font(.system(size: size))
    }
}

extension View {
    func betTextStyle(weight: Font.Weight, color: Color, size: CGFloat) -> some View {
        self.modifier(BetText(weight: weight, color: color, size: size))
    }
}

struct TrendingBetCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("Trending")
                    .resizable()
                    .frame(width: 15, height: 15, alignment: .leading)
                
                Text("Populaire")
                    .betTextStyle(weight: .medium, color: AllinColor.pinkAccentText, size: 17)
            }
            .padding([.leading, .top], 10)
            
            Text("Emre va réussir son TP de CI/CD mercredi?")
                .frame(height: 47)
                .betTextStyle(weight: .heavy, color: .white, size: 17)
                .multilineTextAlignment(.leading)
                .padding([.leading, .trailing], 33)
            
            Spacer()
            
            GeometryReader { geometry in
                HStack(alignment: .center, spacing: 0) {
                    Text("12")
                        .betTextStyle(weight: .bold, color: AllinColor.pinkAccentText, size: 14)
                    
                    Text("joueurs")
                        .betTextStyle(weight: .regular, color: .white, size: 14)
                        .padding([.leading], 2)
                    
                    Text("2.35k")
                        .betTextStyle(weight: .bold, color: AllinColor.pinkAccentText, size: 14)
                        .padding([.leading], 10)
                    
                    Text("points misés")
                        .betTextStyle(weight: .regular, color: .white, size: 14)
                        .padding([.leading], 2)
                }
                .padding([.leading, .bottom, .trailing], 10)
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottom)
            }
        }
        .frame(height: 127, alignment: .topLeading)
        .background(AllinColor.darkerGray)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(AllinColor.gradiantCard, lineWidth: 5)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

struct TrendingBetCard_Previews: PreviewProvider {
    static var previews: some View {
        TrendingBetCard()
    }
}
