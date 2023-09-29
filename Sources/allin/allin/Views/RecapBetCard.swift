//
//  RecapBetCard.swift
//  AllIn
//
//  Created by étudiant on 28/09/2023.
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
                    Text("proposé par Lucas").font(.system(size: 10)).foregroundColor(AllinColor.lightGray)

                }
                Text("Etudes").font(.system(size: 15)).foregroundColor(AllinColor.lightGray)
                Text("Emre va réussir son TP de CI/CD mercredi?").font(.system(size: 20)).fontWeight(.bold)
                HStack{
                    Text("Fini le ").font(.system(size: 15)).foregroundColor(AllinColor.lightGray)
                    TextCapsule()
                    TextCapsule()
                    Spacer()

                }
            }.frame(width: .infinity).padding(.all,15)
                
                .background(AllinColor.BetCardBackground).cornerRadius(20, corners: [.topLeft,.topRight]).padding(.bottom,0)
            VStack(alignment: .leading,spacing: 6){
                HStack{
                    Text("Mise").font(.system(size: 15)).foregroundColor(AllinColor.lightGray).fontWeight(.regular)
                    Spacer()
                    Text("1630").font(.system(size: 15)).foregroundColor(AllinColor.lightGray).fontWeight(.regular)
                    Image("Allcoins").resizable().frame(width: 10,height: 10).overlay {
                        AllinColor.lightGray.frame(width: 10)
                            .mask(
                                Image("Allcoins").resizable().frame(width: 10,height: 10)
                            )
                    }

                }
                HStack{
                    Text("Gains").font(.system(size: 15)).foregroundColor(AllinColor.PrimaryTextColor).fontWeight(.medium)
                    Spacer()
                    Text("1630").font(.system(size: 15)).fontWeight(.medium).overlay {
                        AllinColor.gradiantCard.frame(width: 50)
                        .mask(
                            Text("1630").font(.system(size: 15)).fontWeight(.medium)
                        )
                    }.padding(0)
                    Image("Allcoins").resizable().frame(width: 10,height: 10).overlay {
                        AllinColor.gradiantCard.frame(width: 10)
                            .mask(
                                Image("Allcoins").resizable().frame(width: 10,height: 10)
                            )
                    }

                }
                HStack{
                    Text("Côte totale").font(.system(size: 15)).fontWeight(.medium)
                    Spacer()
                    Text("3,46").font(.system(size: 18)).padding([.leading,.trailing],10).padding([.top,.bottom],5).foregroundColor(.white).fontWeight(.bold).background(AllinColor.gradiantCard).cornerRadius(8, corners: .allCorners)
                    

                }.padding([.bottom],10)
                
                
            }.frame(width: .infinity).padding([.top,.bottom],8).padding([.leading,.trailing],15)
                
                .background(AllinColor.CapsuleGray).cornerRadius(20, corners: [.bottomLeft,.bottomRight]).padding(.bottom,0).border(width: 1, edges: [.top], color: AllinColor.DelimiterGray)
        }.scaleEffect(longPressTap ? 0.97 : 1.0)
            .animation(.easeInOut, value: longPressTap)
            .gesture(
                LongPressGesture(minimumDuration: 0.5) // Vous pouvez ajuster la durée à votre préférence
                    .updating($longPressTap) { value, state, _ in
                        state = value
                    }
            )

    }
}

struct RecapBetCard_Previews: PreviewProvider {
    static var previews: some View {
        RecapBetCard()
    }
}
