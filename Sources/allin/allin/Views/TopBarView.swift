//
//  TopBarView.swift
//  AllIn
//
//  Created by Emre KARTAL on 19/09/2023.
//

import SwiftUI

struct TopBarView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        ZStack{
                HStack{
                    Button(action: {withAnimation{ self.showMenu = !self.showMenu }}) {
                        Image("menu")
                            .resizable()
                            .frame(width: 26,height: 15)
                            .padding(.leading, 30)
                    }
                    Spacer()
                    CoinCounterView()
                }
                .frame(alignment: .top)
                Image("Icon")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .bottom)
                
            }
            .padding([.bottom], 20)
            .padding([.top], 10)
            .background(LinearGradient(gradient:
                                        Gradient(colors:[AllinColor.TopBarColorPink,AllinColor.TopBarColorPurple,AllinColor.TopBarColorBlue]),
                                       startPoint: .bottomLeading, endPoint: .topTrailing))
    }
        
    }
