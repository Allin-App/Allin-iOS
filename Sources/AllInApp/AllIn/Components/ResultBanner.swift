//
//  ResultBanner.swift
//  AllIn
//
//  Created by Lucas Delanier on 15/01/2024.
//

import SwiftUI
import Model

struct ResultBanner: View {
    var finalAnswer: Participation
    var odds: Float
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "trophy.fill").resizable().frame(maxWidth: 70, maxHeight: 60).foregroundColor(AllInColors.blueGrey800Color)
                Text(finalAnswer.answer).font(.system(size: 70)).fontWeight(.bold).foregroundStyle(AllInColors.blueGrey800Color)
            }.frame(height: 80)
            HStack(spacing: 20){
                HStack{
                    Image("BlueAllCoinIcon").resizable().frame(maxWidth: 12, maxHeight: 12)
                    Text(finalAnswer.stake.description).font(.system(size: 16)).fontWeight(.semibold).foregroundStyle(AllInColors.blueGrey800Color)
                }
                HStack{
                    Image("BleuePersonIcon").resizable().frame(maxWidth: 15, maxHeight: 12)
                    Text(finalAnswer.username).font(.system(size: 16)).fontWeight(.semibold).foregroundStyle(AllInColors.blueGrey800Color)
                }
                HStack{
                    Image("BleueTrophyIcon").resizable().frame(maxWidth: 15, maxHeight: 12)
                    Text(odds.description).font(.system(size: 16)).fontWeight(.semibold).foregroundStyle(AllInColors.blueGrey800Color)
                }
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .padding(.vertical, 20).background(AllInColors.winBannerBackground)
        .border(width: 2, edges: [.top,.bottom], color: AllInColors.blueAccentColor.opacity(0.2))
    }
}
