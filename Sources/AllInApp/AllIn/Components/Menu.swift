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
    
    
    let parameters: [(String, String, String, String)] = [
        ("videoGameImage", String(localized: "drawer_create_a_bet"), String(localized: "drawer_create_a_bet_subtitle"), "CreationBet"),
        ("globeImage", String(localized: "drawer_public_bets"), String(localized: "drawer_public_bets_subtitle"), "Bet"),
        ("moneyImage", String(localized: "drawer_current_bets"), String(localized: "drawer_current_bets_subtitle"), "Current"),
        ("eyesImage", String(localized: "drawer_bet_history"), String(localized: "drawer_bet_history_subtitle"),"Historic"),
        ("friendsImage", String(localized: "drawer_friends"), String(localized: "drawer_friends_subtitle"), "Friends"),
        ("rankingImage", String(localized: "drawer_ranking"), String(localized: "drawer_ranking_subtitle"), "Ranking"),
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack() {
                Spacer()
                VStack(){
                    UserPicture(picture: AppStateContainer.shared.user?.image, username: (AppStateContainer.shared.user?.username)!,size: 100)
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
                    Text(AppStateContainer.shared.user?.bestWin.description ?? "0")
                        .fontWeight(.heavy)
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                    Text(String(localized: "drawer_bets"))
                        .fontWeight(.regular)
                        .font(.system(size: 12))
                        .foregroundColor(AllInColors.grey600Color)
                }
                VStack(){
                    Text(AppStateContainer.shared.user?.bestWin.description ?? "0")
                        .fontWeight(.heavy)
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                    Text(String(localized: "drawer_best_win"))
                        .fontWeight(.regular)
                        .font(.system(size: 12))
                        .foregroundColor(AllInColors.grey600Color)
                }
                VStack(){
                    Text(AppStateContainer.shared.user?.nbFriends.description ?? "0")
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
            
            ForEach(0..<parameters.count, id: \.self) { index in
                NavigationLink(destination: MainView(page: parameters[index].3).navigationBarBackButtonHidden(true)) {
                    ParameterMenu(image: parameters[index].0, title: parameters[index].1, description: parameters[index].2)
                        .padding([.leading, .trailing], 13)
                }
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
            NavigationLink(destination: MainView(page: "Profile")
                .navigationBarBackButtonHidden(true))
            {
                Image("gearIcon")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding([.leading,.bottom], 20)
            }
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
