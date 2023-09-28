//
//  MenuView.swift
//  AllIn
//
//  Created by étudiant on 21/09/2023.
//

import SwiftUI

struct MenuView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            NavigationLink(destination: Home(page: "Bet").navigationBarBackButtonHidden(true))
            {
                ParameterMenuView(icon: "VideoGame", title: "CREER UN BET", description: "Créez un nouveau BET et faites participer vos amis.")
                    .padding([.leading,.trailing], 13)
            }
            
            NavigationLink(destination: Home(page: "Ranking").navigationBarBackButtonHidden(true))
            {
                ParameterMenuView(icon: "Eyes", title: "HISTORIQUE DES BETS", description: "Consultez vos paris en cours et terminés.")
                    .padding([.leading,.trailing], 13)
            }
            
            NavigationLink(destination: Home(page: "Friends").navigationBarBackButtonHidden(true))
            {
                ParameterMenuView(icon: "Friends", title: "AMIS", description: "Défiez vos porches en les ajoutant en amis.")
                    .padding([.leading,.trailing], 13)
            }
            
            ParameterMenuView(icon: "Money", title: "BET EN COURS", description: "Gérez vos bets et récompensez les gagnants.")
                .padding([.leading,.trailing], 13)
            
            Spacer()
            Image("GearIcon")
                .resizable()
                .frame(width: 30, height: 30)
                .padding([.leading,.bottom], 20)
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .background(AllinColor.darkerGray)
        .edgesIgnoringSafeArea(.bottom)
        
    }
}
