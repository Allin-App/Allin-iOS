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
                    Text("Bets")
                        .fontWeight(.regular)
                        .font(.system(size: 12))
                        .foregroundColor(AllInColors.grey600Color)
                }
                VStack(){
                    Text("343")
                        .fontWeight(.heavy)
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                    Text("Meilleur gain")
                        .fontWeight(.regular)
                        .font(.system(size: 12))
                        .foregroundColor(AllInColors.grey600Color)
                }
                VStack(){
                    Text("5")
                        .fontWeight(.heavy)
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                    Text("Amis")
                        .fontWeight(.regular)
                        .font(.system(size: 12))
                        .foregroundColor(AllInColors.grey600Color)
                }
                Spacer()
            }
            .padding(.bottom, 15)
            
            NavigationLink(destination: MainView(page: "CreationBet").navigationBarBackButtonHidden(true))
            {
                ParameterMenu(image: "videoGameImage", title: "CREER UN BET", description: "Créez un nouveau BET et faites participer vos amis.")
                    .padding([.leading,.trailing], 13)
            }
            
            NavigationLink(destination: MainView(page: "Historic").navigationBarBackButtonHidden(true))
            {
                ParameterMenu(image: "eyesImage", title: "HISTORIQUE DES BETS", description: "Consultez vos paris en cours et terminés.")
                    .padding([.leading,.trailing], 13)
            }
            
            NavigationLink(destination: MainView(page: "Friends").navigationBarBackButtonHidden(true))
            {
                ParameterMenu(image: "friendsImage", title: "AMIS", description: "Défiez vos porches en les ajoutant en amis.")
                    .padding([.leading,.trailing], 13)
            }
            
            NavigationLink(destination: MainView(page: "Bet").navigationBarBackButtonHidden(true))
            {
                ParameterMenu(image: "moneyImage", title: "BET EN COURS", description: "Gérez vos bets et récompensez les gagnants.")
                    .padding([.leading,.trailing], 13)
            }
            NavigationLink(destination: MainView(page: "Ranking").navigationBarBackButtonHidden(true))
            {
                ParameterMenu(image: "rankingImage", title: "CLASSEMENT", description: "Consultez votre classement parmis vos amis.")
                    .padding([.leading,.trailing], 13)
            }
            
            HStack {
                Spacer()
                Button {
                    authService.logout()
                } label: {
                    Text("Deconnexion")
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
