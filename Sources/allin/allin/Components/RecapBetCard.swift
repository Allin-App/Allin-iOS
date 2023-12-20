//
//  RecapBetCard.swift
//  AllIn
//
//  Created by Lucas on 28/09/2023.
//

import SwiftUI

struct RecapBetCard: View {
    
    @GestureState private var longPressTap = false
    @State private var isPressed = false
    var body: some View {
        VStack(spacing: 0){
            VStack(alignment: .leading,spacing: 2){
                HStack{
                    Spacer()
                    Text("proposé par Lucas")
                        .font(.system(size: 10))
                        .foregroundColor(AllInColors.grey800Color)
                    
                }
                Text("Etudes")
                    .font(.system(size: 15))
                    .foregroundColor(AllInColors.grey800Color)
                Text("Emre va réussir son TP de CI/CD mercredi?")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                HStack{
                    Text("Fini le ")
                        .font(.system(size: 15))
                        .foregroundColor(AllInColors.grey800Color)
                    TextCapsule()
                    TextCapsule()
                    Spacer()
                }
            }
            .frame(width: .infinity)
            .padding(.all,15)
            .background(AllInColors.componentBackgroundColor).cornerRadius(20, corners: [.topLeft,.topRight])
            .padding(.bottom,0)
            
            VStack(alignment: .leading,spacing: 6){
                HStack{
                    Text("Mise")
                        .textStyle(weight: .regular, color: AllInColors.grey800Color, size: 15)
                    Spacer()
                    Text("1630")
                        .textStyle(weight: .regular, color: AllInColors.grey800Color, size: 15)
                    Image("Allcoins")
                        .resizable()
                        .frame(width: 10,height: 10)
                        .overlay {
                            AllInColors.grey800Color.frame(width: 10)
                                .mask(
                                    Image("Allcoins").resizable().frame(width: 10,height: 10)
                                )
                        }
                    
                }
                HStack{
                    Text("Gains")
                        .textStyle(weight: .medium, color: AllInColors.lightPurpleColor, size: 15)
                    Spacer()
                    Text("1630")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .overlay {
                            AllInColors.primaryGradient.frame(width: 50)
                                .mask(
                                    Text("1630").font(.system(size: 15)).fontWeight(.medium)
                                )
                        }
                        .padding(0)
                    
                    Image("Allcoins").resizable().frame(width: 10,height: 10).overlay {
                        AllInColors.primaryGradient.frame(width: 10)
                            .mask(
                                Image("Allcoins").resizable().frame(width: 10,height: 10)
                            )
                    }
                    
                }
                HStack{
                    Text("Côte totale").font(.system(size: 15)).fontWeight(.medium)
                    Spacer()
                    Text("3,46")
                        .textStyle(weight: .bold, color: .white, size: 18)
                        .padding([.leading,.trailing],10)
                        .padding([.top,.bottom],5)
                        .background(AllInColors.primaryGradient)
                        .cornerRadius(8, corners: .allCorners)
                    
                    
                }.padding([.bottom],10)
                
                
            }.frame(width: .infinity)
                .padding([.top,.bottom],8)
                .padding([.leading,.trailing],15)
                .background(AllInColors.underComponentBackgroundColor)
                .cornerRadius(20, corners: [.bottomLeft,.bottomRight])
                .padding(.bottom,0).border(width: 1, edges: [.top], color: AllInColors.delimiterGrey)
        }.scaleEffect(longPressTap ? 0.97 : 1.0)
            .animation(.easeInOut, value: longPressTap)
            .gesture(
                LongPressGesture(minimumDuration: 0.5)
                    .updating($longPressTap) { value, state, _ in
                        state = value
                    }
            )
    }
}

struct RecapBetCard_Previews: PreviewProvider {
    static var previews: some View {
        RecapBetCard()
            .preferredColorScheme(.dark)
    }
}
