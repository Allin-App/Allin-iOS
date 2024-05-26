//
//  Menu.swift
//  AllIn
//
//  Created by Emre on 21/09/2023.
//

import SwiftUI
import DependencyInjection

struct Menu: View {
    
    @Inject var authService: IAuthService
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack() {
                Spacer()
                VStack(){
                    Image("defaultUserImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .cornerRadius(180)
                    Text(AppStateContainer.shared.user?.username.capitalized ?? "")
                        .fontWeight(.medium)
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .padding(.bottom, 10)
            
            HStack(spacing: 30) {
                Spacer()
                VStack(){
                    Text("114")
                        .fontWeight(.heavy)
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                    Text(String(localized: "drawer_bets"))
                        .fontWeight(.regular)
                        .font(.system(size: 12))
                        .foregroundColor(AllInColors.grey600Color)
                }
                VStack(){
                    Text("343")
                        .fontWeight(.heavy)
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                    Text(String(localized: "drawer_best_win"))
                        .fontWeight(.regular)
                        .font(.system(size: 12))
                        .foregroundColor(AllInColors.grey600Color)
                }
                VStack(){
                    Text("5")
                        .fontWeight(.heavy)
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                    Text(String(localized: "drawer_nb_friends"))
                        .fontWeight(.regular)
                        .font(.system(size: 12))
                        .foregroundColor(AllInColors.grey600Color)
                }
                Spacer()
            }
            .padding(.bottom, 15)
            
            NavigationLink(destination: MainView(page: "CreationBet").navigationBarBackButtonHidden(true))
            {
                ParameterMenu(image: "videoGameImage", title: String(localized: "drawer_create_a_bet"), description: String(localized: "drawer_create_a_bet_subtitle"))
                    .padding([.leading,.trailing], 13)
            }
            
            NavigationLink(destination: MainView(page: "Historic")
                .navigationBarBackButtonHidden(true))
            {
                ParameterMenu(image: "eyesImage", title: String(localized: "drawer_bet_history"), description: String(localized: "drawer_bet_history_subtitle"))
                    .padding([.leading,.trailing], 13)
            }
            
            NavigationLink(destination: MainView(page: "Friends")
                .navigationBarBackButtonHidden(true))
            {
                ParameterMenu(image: "friendsImage", title: String(localized: "drawer_friends"), description: String(localized: "drawer_friends_subtitle"))
                    .padding([.leading,.trailing], 13)
            }
            
            VStack {
                NavigationLink(destination: MainView(page: "Bet")
                    .navigationBarBackButtonHidden(true))
                {
                    ParameterMenu(image: "moneyImage", title: String(localized: "drawer_public_bets"), description: String(localized: "drawer_public_bets_subtitle"))
                        .padding([.leading,.trailing], 13)
                }
                NavigationLink(destination: MainView(page: "Ranking").navigationBarBackButtonHidden(true))
                {
                    ParameterMenu(image: "rankingImage", title: String(localized: "drawer_ranking"), description: String(localized: "drawer_ranking_subtitle"))
                        .padding([.leading,.trailing], 13)
                }
            }
            
            NavigationLink(destination: MainView(page: "Current").navigationBarBackButtonHidden(true))
            {
                ParameterMenu(image: "eyesImage", title: String(localized: "drawer_current_bets"), description: String(localized: "drawer_current_bets_subtitle"))
                    .padding([.leading,.trailing], 13)
            }
            
            HStack {
                Spacer()
                Button {
                    authService.logout()
                } label: {
                    Text("generic_logout")
                        .foregroundColor(.white)
                }
                Spacer()
            }
            
            Spacer()
            Image("gearIcon")
                .resizable()
                .frame(width: 30, height: 30)
                .padding([.leading,.bottom], 20)
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .background(AllInColors.primaryColor)
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
