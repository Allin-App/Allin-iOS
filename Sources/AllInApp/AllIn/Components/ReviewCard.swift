//
//  BetCard.swift
//  AllIn
//
//  Created by Lucas on 24/09/2023.
//

import SwiftUI
import Model

struct ReviewCard: View {
    
    @State var showDetails: Bool = false
    @State var showPartipated: Bool = false
    @State var betDetail: BetDetail
    
    var amountBetted: Int
    var isAWin: Bool
    
    var body: some View {
        VStack(spacing: 0){
            VStack(alignment: .leading,spacing: 2){
                HStack{
                    Spacer()
                    Text("bet_proposed_by_format \(betDetail.bet.author)")
                        .font(.system(size: 10))
                        .foregroundColor(AllInColors.grey800Color)
                    
                }
                Text(betDetail.bet.theme).font(.system(size: 15)).foregroundColor(AllInColors.grey800Color)
                Text(betDetail.bet.phrase).font(.system(size: 20)).fontWeight(.bold)
                HStack{
                    Text("bet_ends").font(.system(size: 15)).foregroundColor(AllInColors.grey800Color)
                    TextCapsule(date: betDetail.bet.endBetDate)
                    Spacer()
                    
                }
            }
            .frame(width: .infinity)
            .padding(.all,15)
            .background(AllInColors.componentBackgroundColor)
            .cornerRadius(20, corners: [.topLeft,.topRight]).padding(.bottom,0)
            
            VStack(alignment: .center,spacing:0){
                HStack(){
                    Spacer()
                    switch betDetail.bet.status {
                    case .inProgress:
                        Text(betDetail)
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                    case .waiting:
                        Text("waiting")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                    case .closing:
                        Text("bet_finished")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                    case .finished:
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
                    case .cancelled:
                        Text("cancelled")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                    }
                    Spacer()
                    
                }
                .frame(width: .infinity)
                .padding(.all,10)
                
            }
            .frame(width: .infinity)
            .padding(.all,2)
            .background({
                switch betDetail.bet.status {
                case .inProgress, .waiting, .closing:
                    return AllInColors.grey50Color
                case .finished:
                    return Color.black
                case .cancelled:
                    return Color.red
                }
            }())

            .cornerRadius(20, corners: [.bottomLeft,.bottomRight])
            .border(width: 1, edges: [.top], color: AllInColors.delimiterGrey)
        }
        .onTapGesture {
            showDetails.toggle()
        }.fullScreenCover(isPresented: $showDetails) {
            DetailsView(isModalPresented: $showDetails, isModalParticipated: $showPartipated, id: betDetail.bet.id)
        }
    }
}
