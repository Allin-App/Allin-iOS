//
//  ResultBanner.swift
//  AllIn
//
//  Created by Lucas Delanier on 15/01/2024.
//

import SwiftUI

struct ResultBanner: View {
    var body: some View {
        VStack{
            HStack{
                Image("BleueTrophyIcon").resizable().frame(maxWidth: 70, maxHeight: 60)
                Text("OUI").font(.system(size: 70)).fontWeight(.bold).foregroundStyle(AllInColors.blueGrey800Color)
            }.frame(height: 80)
            HStack(spacing: 20){
                HStack{
                    Image("BlueAllCoinIcon").resizable().frame(maxWidth: 12, maxHeight: 12)
                    Text("460").font(.system(size: 16)).fontWeight(.semibold).foregroundStyle(AllInColors.blueGrey800Color)
                }
                HStack{
                    Image("BleuePersonIcon").resizable().frame(maxWidth: 15, maxHeight: 12)
                    Text("ImriDu43").font(.system(size: 16)).fontWeight(.semibold).foregroundStyle(AllInColors.blueGrey800Color)
                }
                HStack{
                    Image("BleueTrophyIcon").resizable().frame(maxWidth: 15, maxHeight: 12)
                    Text("x1.2").font(.system(size: 16)).fontWeight(.semibold).foregroundStyle(AllInColors.blueGrey800Color)
                }
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .padding(.vertical, 20).background(AllInColors.winBannerBackground)
        .border(width: 2, edges: [.top,.bottom], color: AllInColors.blueAccentColor.opacity(0.2))
    }
}

#Preview {
    ResultBanner()
}
