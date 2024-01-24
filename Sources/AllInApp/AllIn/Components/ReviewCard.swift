//
//  BetCard.swift
//  AllIn
//
//  Created by Lucas on 24/09/2023.
//

import SwiftUI

struct ReviewCard: View {
    @State var showDetails: Bool = false
    @State var showPartipated: Bool = false
    
    var amountBetted: Int
    var isAWin: Bool
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
                    Text("Fini le").font(.system(size: 15)).foregroundColor(AllInColors.grey800Color)
                    TextCapsule(date: Date())
                    Spacer()
                    
                }
            }
            .frame(width: .infinity)
            .padding(.all,15)
            .background(AllInColors.componentBackgroundColor).cornerRadius(20, corners: [.topLeft,.topRight]).padding(.bottom,0)
            
            VStack(alignment: .center,spacing:0){
                HStack(){
                    Spacer()
                    Text(amountBetted.description)
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    Image("allcoinWhiteIcon")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .bottom)
                    Text(isAWin ? "Gagnés!" : "Perdus!")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    Spacer()

                }
                .frame(width: .infinity)
                .padding(.all,10)
                
                    
                        
                
                
            }
            .frame(width: .infinity)
            .padding(.all,2)
            .background(
                isAWin ?
                AnyView(AllInColors.primaryGradient) :
                AnyView(Color.black)
            )            .cornerRadius(20, corners: [.bottomLeft,.bottomRight])
            .border(width: 1, edges: [.top], color: AllInColors.delimiterGrey)
        }
        .onTapGesture {
            showDetails.toggle()
        }.fullScreenCover(isPresented: $showDetails) {
            DetailsView(isModalPresented: $showDetails, isModalParticipated: $showPartipated, id: "1")
        }
    }
}
