//
//  BetCard.swift
//  AllIn
//
//  Created by Lucas on 24/09/2023.
//

import SwiftUI

struct BetCard: View {
    var body: some View {
        VStack(spacing: 0){
            VStack(alignment: .leading,spacing: 2){
                HStack{
                    Spacer()
                    Text("proposé par Lucas").font(.system(size: 10)).foregroundColor(AllInColors.grey800Color)
                    
                }
                Text("Etudes").font(.system(size: 15)).foregroundColor(AllInColors.grey800Color)
                Text("Emre va réussir son TP de CI/CD mercredi?").font(.system(size: 20)).fontWeight(.bold)
                HStack{
                    Text("Commence le").font(.system(size: 15)).foregroundColor(AllInColors.grey800Color)
                    TextCapsule()
                    TextCapsule()
                    Spacer()
                    
                }
            }
            .frame(width: .infinity)
            .padding(.all,15)
            .background(AllInColors.componentBackgroundColor).cornerRadius(20, corners: [.topLeft,.topRight]).padding(.bottom,0)
            
            VStack(alignment: .leading,spacing: 2){
                HStack{
                    Spacer()
                    UsersPreview()
                    Text(" 4 joueurs en attente").font(.system(size: 15)).foregroundColor(AllInColors.grey800Color).fontWeight(.medium)
                    
                    Spacer()
                    
                }.padding(0)
                Button {
                    
                } label: {
                    Text("Participer")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity).padding(10)
                        .multilineTextAlignment(.center)
                        .overlay {
                            AllInColors.primaryGradient.frame(width: 170)
                                .mask(
                                    Text("Participer")
                                        .font(.system(size: 30))
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity).padding(10)
                                )
                        }
                }
                .accentColor(AllInColors.componentBackgroundColor)
                .buttonStyle(.borderedProminent).cornerRadius(4.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 12).stroke(AllInColors.delimiterGrey, lineWidth: 1)
                ).padding([.top],5)
                
            }
            .frame(width: .infinity)
            .padding(.all,8)
            .background(AllInColors.underComponentBackgroundColor)
            .cornerRadius(20, corners: [.bottomLeft,.bottomRight])
            .border(width: 1, edges: [.top], color: AllInColors.delimiterGrey)
        }
    }
}

struct BetCard_Previews: PreviewProvider {
    static var previews: some View {
        BetCard()
            .preferredColorScheme(.dark)
    }
}
