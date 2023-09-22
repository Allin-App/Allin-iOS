//
//  MenuView.swift
//  AllIn
//
//  Created by étudiant on 21/09/2023.
//

import SwiftUI

struct MenuView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ParameterMenuView(icon: "VideoGame", title: "CREER UN BET")
                .padding(.top, 100)
            
            ParameterMenuView(icon: "Eyes", title: "HISTORIQUE DES BETS")
                .padding(.top, 30)
            
            ParameterMenuView(icon: "Friends", title: "AMIS")
                .padding(.top, 30)
            
            ParameterMenuView(icon: "Money", title: "BET EN COURS")
                .padding(.top, 30)
            Spacer()
            Image("GearIcon")
                .resizable()
                .frame(width: 30, height: 30)
                .padding([.leading,.bottom], 20)
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .background(AllinColor.darkerGray)
        .edgesIgnoringSafeArea(.all)
        
    }
}
