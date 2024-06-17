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
    var bet: Bet
    var amount: Int
    var isWin: Bool
    
    var body: some View {
        VStack(spacing: 0){
            VStack(alignment: .leading,spacing: 2){
                HStack{
                    Spacer()
                    Text("bet_proposed_by_format \(bet.author)")
                        .font(.system(size: 10))
                        .foregroundColor(AllInColors.grey800Color)
                    
                }
                Text(bet.theme).font(.system(size: 15)).foregroundColor(AllInColors.grey800Color)
                Text(bet.phrase).font(.system(size: 20)).fontWeight(.bold)
                HStack{
                    Text("bet_ends").font(.system(size: 15)).foregroundColor(AllInColors.grey800Color)
                    TextCapsule(date: bet.endBetDate)
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
                    if bet.status == .finished {
                        Text(amount.description)
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        Image("allcoinWhiteIcon")
                            .resizable()
                            .frame(width: 18, height: 20)
                    }
                    
                    switch bet.status {
                    case .waiting, .inProgress:
                        Text("bet_status_stake")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                    case .closing:
                        Text("bet_status_finished")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                    case .finished:
                        Text(isWin ? "Gagnés!" : "Perdus!")
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
            .background(backgroundColor())
            .cornerRadius(20, corners: [.bottomLeft,.bottomRight])
            
        }
        .onTapGesture {
            showDetails.toggle()
        }.fullScreenCover(isPresented: $showDetails) {
            DetailsView(isModalPresented: $showDetails, isModalParticipated: $showPartipated, id: bet.id)
        }
    }
    
    private func backgroundColor() -> some View {
            Group {
                if bet.status == .finished && isWin {
                    AllInColors.primaryGradient
                } else {
                    switch bet.status {
                    case .inProgress, .waiting, .closing:
                        AllInColors.grey50Color
                    case .finished:
                        Color.black
                    case .cancelled:
                        Color.red
                    }
                }
            }
        }
}
