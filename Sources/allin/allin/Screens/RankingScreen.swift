//
//  RankingScreen.swift
//  AllIn
//
//  Created by étudiant on 27/09/2023.
//

import SwiftUI

struct Ranking: View {
    
    @Binding var showMenu: Bool
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            TopBarView(showMenu: self.$showMenu)
            Text("Classement")
                .betTextStyle(weight: .bold, color: AllinColor.titleColor, size: 25)
                .padding([.top,.bottom],15)
            
            HStack {
                ZStack {
                    VStack(spacing: 0){
                        Spacer()
                        Text("Pseudo")
                            .fontWeight(.bold)
                            .padding(.bottom, 4)
                            .font(.system(size: 18))
                            .lineLimit(1)
                        Divider()
                            .background(AllinColor.Gray_100)
                        HStack{
                            Spacer()
                            Image("AllCoinsIcon")
                                .resizable()
                                .frame(width: 18, height: 18, alignment: .leading)
                                .padding([.top,.bottom],10)
                            Text(String("570"))
                                .betTextStyle(weight: .black, color: AllinColor.PrimaryTextColor, size: 16)
                                .padding(.trailing, 18)
                            Spacer()
                        }
                        .frame(width: 167)
                        .background(AllinColor.VeryLightGray)
                    }
                    .frame(width: 167, height: 110)
                    .background(AllinColor.RankingRowBackground)
                    .cornerRadius(41.5, corners: .topLeft)
                    .cornerRadius(8, corners: .topRight)
                    .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                    
                    Image("DefaultUserIcon")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .scaledToFit()
                        .cornerRadius(180)
                        .offset(x: 0, y: -55)
                    
                    Text("1")
                        .frame(width: 28, height: 28)
                        .foregroundColor(.white)
                        .background(AllinColor.PrimaryTextColor)
                        .cornerRadius(30)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .offset(x: 0, y: -23)
                }
                Spacer()
                ZStack {
                    VStack(spacing: 0){
                        Spacer()
                        Text("Pseudo")
                            .fontWeight(.bold)
                            .padding(.bottom, 4)
                            .font(.system(size: 16))
                            .lineLimit(1)
                        Divider()
                            .background(AllinColor.Gray_100)
                        HStack{
                            Spacer()
                            Image("AllCoinsIcon")
                                .resizable()
                                .frame(width: 18, height: 18, alignment: .leading)
                                .padding([.top,.bottom],10)
                            Text(String("570"))
                                .betTextStyle(weight: .black, color: AllinColor.PrimaryTextColor, size: 16)
                                .padding(.trailing, 18)
                            Spacer()
                        }
                        .frame(width: 167)
                        .background(AllinColor.VeryLightGray)
                    }
                    .frame(width: 167, height: 95)
                    .background(AllinColor.RankingRowBackground)
                    .cornerRadius(27.5, corners: .topRight)
                    .cornerRadius(8, corners: .topLeft)
                    .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                    
                    Image("DefaultUserIcon")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .scaledToFit()
                        .cornerRadius(180)
                        .offset(x: 0, y: -50)
                    
                    Text("2")
                        .frame(width: 23, height: 23)
                        .foregroundColor(.white)
                        .background(AllinColor.PrimaryTextColor)
                        .cornerRadius(30)
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .offset(x: 0, y: -22)
                }
                .padding(.top, 10)
            
            }
            .padding([.leading,.trailing,.top],20)
            
            ScrollView(showsIndicators: false){
                RankingRowView(number: 3, image: "DefaultUserIcon", pseudo: "Lucas", allCoins: 541)
                RankingRowView(number: 4, image: "DefaultUserIcon", pseudo: "Arthur", allCoins: 542)
            }.padding(.top, 15)
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom).background(AllinColor.backgroundWhite)
    }
    
}
