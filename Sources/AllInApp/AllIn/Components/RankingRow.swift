//
//  RankingRow.swift
//  AllIn
//
//  Created by Emre on 27/09/2023.
//

import SwiftUI

struct RankingRow: View {
    
    var number: Int
    var image: String?
    var pseudo: String
    var allCoins: Int
    
    var body: some View {
        HStack(){
            Text(number.description)
                .textStyle(weight: .bold, color: AllInColors.lightPurpleColor, size: 18)
            UserInfo(username: pseudo, picture: image, value: allCoins)
        }
        .padding(10)
        .padding(.horizontal, 5)
        .background(AllInColors.componentBackgroundColor)
        .cornerRadius(8)
        .frame(maxWidth: 750)
    }
}

struct RankingRow_Previews: PreviewProvider {
    static var previews: some View {
        RankingRow(number: 3, image: "defaultUserImage", pseudo: "Lucas", allCoins: 541)
    }
}
