//
//  BetCard.swift
//  AllIn
//
//  Created by Lucas on 24/09/2023.
//

import SwiftUI
import Model

struct BetCard: View {
    
    var bet: Bet
    @State var showDetails: Bool = false

    var body: some View {
        VStack(spacing: 0){
            VStack(alignment: .leading,spacing: 2){
                HStack{
                    Spacer()
                    Text("proposé par " + bet.author.username.capitalized).font(.system(size: 10)).foregroundColor(AllInColors.grey800Color)
                    
                }
                Text(bet.theme).font(.system(size: 15)).foregroundColor(AllInColors.grey800Color)
                Text(bet.phrase).font(.system(size: 20)).fontWeight(.bold)
                HStack{
                    Text("Commence le").font(.system(size: 15)).foregroundColor(AllInColors.grey800Color)
                    TextCapsule(date: bet.endRegisterDate)
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
                    Text(String(bet.registered.count) + " joueurs en attente").font(.system(size: 15)).foregroundColor(AllInColors.grey800Color).fontWeight(.medium)
                    
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
                
                VStack(alignment: .leading,spacing: 2){
                    HStack{
                        Spacer()
                        UsersPreview()
                        Text(" 4 joueurs en attente").font(.system(size: 15)).foregroundColor(AllInColors.grey800Color).fontWeight(.medium)
                        
                        Spacer()
                        
                    }.padding(0)
                    ParticipateButton().padding(.top, 5)
                    
                }
                .frame(width: .infinity)
                .padding(.all,8)
                .background(AllInColors.underComponentBackgroundColor)
                .cornerRadius(20, corners: [.bottomLeft,.bottomRight])
                .border(width: 1, edges: [.top], color: AllInColors.delimiterGrey)
            }
        }.onTapGesture {
            showDetails.toggle()
        }.fullScreenCover(isPresented: $showDetails) {
            DetailsView(isModalPresented: $showDetails, id: bet.id)
        }
        
    }
}

struct BetCard_Previews: PreviewProvider {
    static var previews: some View {
        BetCard(bet: BinaryBet(theme: "Football - Finale de la Ligue des Champions",
                phrase: "Le gagnant de la finale sera l'équipe avec le plus de tirs au but.",
                endRegisterDate: Date().addingTimeInterval(86400),
                endBetDate: Date().addingTimeInterval(172800),
                totalStakes: 100,
                isPublic: true,
                invited: [],
                author: User(username: "Imri", email: "emre.kartal@etu.uca.fr", nbCoins: 75, friends: []),
                registered: []))
            .preferredColorScheme(.dark)
    }
}
