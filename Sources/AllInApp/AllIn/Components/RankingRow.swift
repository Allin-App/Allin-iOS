//
//  RankingRow.swift
//  AllIn
//
//  Created by Emre on 27/09/2023.
//

import SwiftUI

struct RankingRow: View {
    
    var number: Int
    var image: String
    var pseudo: String
    var allCoins: Int
    
    var body: some View {
        HStack(){
            Text(number.description)
                .textStyle(weight: .bold, color: AllInColors.lightPurpleColor, size: 18)
                .padding(.leading, 15)
            
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .cornerRadius(180)
                .padding([.bottom,.top], 10)
            Text(pseudo)
                .fontWeight(.medium)
                .font(.system(size: 16))
                .lineLimit(1)
            Spacer()
            Image("allcoinIcon")
                .resizable()
                .frame(width: 17, height: 17, alignment: .leading)
            Text(allCoins.description)
                .textStyle(weight: .black, color: AllInColors.lightPurpleColor, size: 16)
                .padding(.trailing, 15)
        }
        .background(AllInColors.componentBackgroundColor)
        .cornerRadius(8)
        .padding([.leading,.trailing],20)
        .frame(maxWidth: 750)
    }
}

struct RankingRow_Previews: PreviewProvider {
    static var previews: some View {
        RankingRow(number: 3, image: "defaultUserImage", pseudo: "Lucas", allCoins: 541)
    }
}
