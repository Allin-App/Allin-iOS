//
//  RankingView.swift
//  AllIn
//
//  Created by Emre on 27/09/2023.
//

import SwiftUI

struct RankingView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0) {
                TopBar(showMenu: self.$showMenu)
                Text("ranking_title")
                    .textStyle(weight: .bold, color: AllInColors.grey500Color, size: 25)
                    .padding([.top,.bottom],15)
                
                HStack {
                    ZStack {
                        VStack(spacing: 0){
                            Spacer()
                            Text("Pseudo")
                                .fontWeight(.bold)
                                .padding(.bottom, 4)
                                .font(.system(size: 16))
                                .lineLimit(1)
                            Divider()
                                .background(AllInColors.lightGrey100Color)
                            HStack{
                                Spacer()
                                Image("allcoinIcon")
                                    .resizable()
                                    .frame(width: 18, height: 18, alignment: .leading)
                                    .padding([.top,.bottom],10)
                                Text(String("570"))
                                    .textStyle(weight: .black, color: AllInColors.lightPurpleColor, size: 16)
                                    .padding(.trailing, 18)
                                Spacer()
                            }
                            .frame(width: geometry.size.width * 0.43)
                            .background(AllInColors.underComponentBackgroundColor)
                        }
                        .frame(width: geometry.size.width * 0.43, height: 120)
                        .background(AllInColors.componentBackgroundColor)
                        .cornerRadius(41.5, corners: .topLeft)
                        .cornerRadius(8, corners: .topRight)
                        .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                        
                        Image("defaultUserImage")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .scaledToFit()
                            .cornerRadius(180)
                            .offset(x: 0, y: -55)
                        
                        Text("1")
                            .frame(width: 28, height: 28)
                            .foregroundColor(.white)
                            .background(AllInColors.lightPurpleColor)
                            .cornerRadius(30)
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .offset(x: 0, y: -23)
                    }
                    ZStack {
                        VStack(spacing: 0){
                            Spacer()
                            Text("Pseudo")
                                .fontWeight(.bold)
                                .padding(.bottom, 4)
                                .font(.system(size: 15))
                                .lineLimit(1)
                            Divider()
                                .background(AllInColors.lightGrey100Color)
                            HStack{
                                Spacer()
                                Image("allcoinIcon")
                                    .resizable()
                                    .frame(width: 18, height: 18, alignment: .leading)
                                    .padding([.top,.bottom],10)
                                Text(String("570"))
                                    .textStyle(weight: .black, color: AllInColors.lightPurpleColor, size: 16)
                                    .padding(.trailing, 18)
                                Spacer()
                            }
                            .frame(width: geometry.size.width * 0.43)
                            .background(AllInColors.underComponentBackgroundColor)
                        }
                        .frame(width: geometry.size.width * 0.43, height: 90)
                        .background(AllInColors.componentBackgroundColor)
                        .cornerRadius(27.5, corners: .topRight)
                        .cornerRadius(8, corners: .topLeft)
                        .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                        
                        Image("defaultUserImage")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .scaledToFit()
                            .cornerRadius(180)
                            .offset(x: 0, y: -50)
                        
                        Text("2")
                            .frame(width: 23, height: 23)
                            .foregroundColor(.white)
                            .background(AllInColors.lightPurpleColor)
                            .cornerRadius(30)
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .offset(x: 0, y: -22)
                    }
                    .padding(.top, 28)
                    
                }
                .padding([.leading,.trailing,.top],20)
                
                ScrollView(showsIndicators: false){
                    VStack(spacing: 10) {
                        RankingRow(number: 3, image: "defaultUserImage", pseudo: "Lucas", allCoins: 541)
                        RankingRow(number: 4, image: "defaultUserImage", pseudo: "Arthur", allCoins: 542)
                    }
                }.padding(.top, 10)
                Spacer()
            }
            .edgesIgnoringSafeArea(.bottom).background(AllInColors.backgroundColor)
        }
    }
}

struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView(showMenu: .constant(false))
    }
}
