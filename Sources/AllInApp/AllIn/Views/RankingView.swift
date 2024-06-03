//
//  RankingView.swift
//  AllIn
//
//  Created by Emre on 27/09/2023.
//

import SwiftUI

struct RankingView: View {
    
    @Binding var showMenu: Bool
    @StateObject var viewModel = RankingViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0) {
                TopBar(showMenu: self.$showMenu)
                Text("ranking_title")
                    .textStyle(weight: .bold, color: AllInColors.grey500Color, size: 25)
                    .padding([.top,.bottom], 15)
                
                HStack {
                    if viewModel.friends.indices.contains(0) {
                        ZStack {
                            VStack(spacing: 0) {
                                Spacer()
                                Text(viewModel.friends[0].username)
                                    .fontWeight(.bold)
                                    .padding(.bottom, 4)
                                    .font(.system(size: 16))
                                    .lineLimit(1)
                                Divider()
                                    .background(AllInColors.lightGrey100Color)
                                HStack {
                                    Spacer()
                                    Image("allcoinIcon")
                                        .resizable()
                                        .frame(width: 18, height: 18, alignment: .leading)
                                        .padding([.top, .bottom], 10)
                                    Text(String(viewModel.friends[0].nbCoins))
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
                    }
                    if viewModel.friends.indices.contains(1) {
                        ZStack {
                            VStack(spacing: 0) {
                                Spacer()
                                Text(viewModel.friends[1].username)
                                    .fontWeight(.bold)
                                    .padding(.bottom, 4)
                                    .font(.system(size: 15))
                                    .lineLimit(1)
                                Divider()
                                    .background(AllInColors.lightGrey100Color)
                                HStack {
                                    Spacer()
                                    Image("allcoinIcon")
                                        .resizable()
                                        .frame(width: 18, height: 18, alignment: .leading)
                                        .padding([.top, .bottom], 10)
                                    Text(String(viewModel.friends[1].nbCoins))
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
                                .frame(width: 50, height: 50)
                                .scaledToFit()
                                .cornerRadius(180)
                                .offset(x: 0, y: -50)
                            
                            Text("2")
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                                .background(AllInColors.lightPurpleColor)
                                .cornerRadius(30)
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                                .offset(x: 0, y: -28)
                        }
                        .padding(.top, 28)
                    }
                }
                .padding([.leading, .trailing, .top], 20)
                
                if viewModel.friends.count == 1 {
                    EmptyInfo(emoji:"👀", title: String(localized: "empty_ranking_title"), explain: String(localized: "empty_ranking_explain")).padding(.top, 40)

                }
                else{
                    ScrollView(showsIndicators: false) {
                        ForEach(viewModel.friends.indices.dropFirst(2), id: \.self) { index in
                            let friend = viewModel.friends[index]
                            RankingRow(
                                number: index + 1,
                                image: "defaultUserImage",
                                pseudo: friend.username,
                                allCoins: friend.nbCoins
                            )
                        }
                    }
                    .padding(.top, 10)
                }
                Spacer()
            }
            .edgesIgnoringSafeArea(.bottom).background(AllInColors.backgroundColor)
        }
    }
}
