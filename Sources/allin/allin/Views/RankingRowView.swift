//
//  RankingRowView.swift
//  AllIn
//
//  Created by étudiant on 27/09/2023.
//

import SwiftUI

struct RankingRowView: View {
    
    var number: Int
    var image: String
    var pseudo: String
    var allCoins: Int
    var body: some View {
        HStack(){
            Text(String(number))
                .padding(.leading, 15)
                .betTextStyle(weight: .bold, color: AllinColor.PrimaryTextColor, size: 18)
            
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
            Image("AllCoinsIcon")
                .resizable()
                .frame(width: 17, height: 17, alignment: .leading)
            Text(String(allCoins))
                .betTextStyle(weight: .black, color: AllinColor.PrimaryTextColor, size: 16)
                .padding(.trailing, 15)
        }
        .background(AllinColor.RankingRowBackground)
        .cornerRadius(8)
        .padding([.leading,.trailing],20)
    }
}

