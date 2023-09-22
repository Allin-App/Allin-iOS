//
//  TopBarView.swift
//  AllIn
//
//  Created by Emre KARTAL on 19/09/2023.
//

import SwiftUI

struct TopBarView: View {
    var body: some View {
        let TopBarColorPink = Color(red: 249/255, green: 81/255, blue: 168/255)
        let TopBarColorBlue = Color(red: 25/255, green: 159/255, blue: 238/255)
        let TopBarColorPurple = Color(red: 170/255, green: 126/255, blue: 243/255)
        ZStack{
                HStack{
                    Image("menu")
                        .resizable()
                        .frame(width: 26,height: 15)
                    Spacer()
                    CoinCounterView()
                        
                }
                .frame(alignment: .top)
                .padding(.leading, 20)
                Image("Icon")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .bottom)
                
            }
            .padding([.bottom], 20)
            .padding([.top], 10)
            .background(LinearGradient(gradient:
                       Gradient(colors:[TopBarColorPink,TopBarColorPurple,TopBarColorBlue]),
                                       startPoint: .bottomLeading, endPoint: .topTrailing))
    }
        
    }
