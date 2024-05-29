//
//  ProfileView.swift
//  AllIn
//
//  Created by étudiant on 26/05/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var showMenu: Bool
    
    let parameters: [(title: String, icon: String, backgroundColor: Color, itemColor: Color)] = [
        (title: "Changer de pseudo", icon: "person", backgroundColor: AllInColors.componentBackgroundColor, itemColor: AllInColors.secondaryTextColor),
        (title: "Changer le mot de passe", icon: "lock", backgroundColor: AllInColors.componentBackgroundColor, itemColor: AllInColors.secondaryTextColor),
        (title: "Supprimer le compte", icon: "trash", backgroundColor: AllInColors.componentBackgroundColor, itemColor: AllInColors.secondaryTextColor),
        (title: "Déconnexion", icon: "xmark", backgroundColor: AllInColors.lightPurpleColor, itemColor: .white)
    ]
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 0) {
                TopBar(showMenu: self.$showMenu)
                
                VStack(alignment: .leading) {
                    HStack {
                        Image("defaultUserImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .cornerRadius(180)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Pseudo")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                            
                            HStack(spacing: 15) {
                                VStack(){
                                    Text("114")
                                        .fontWeight(.heavy)
                                        .font(.system(size: 15))
                                    Text(String(localized: "drawer_bets"))
                                        .fontWeight(.regular)
                                        .font(.system(size: 12))
                                        .foregroundColor(AllInColors.grey600Color)
                                }
                                VStack(){
                                    Text("343")
                                        .fontWeight(.heavy)
                                        .font(.system(size: 15))
                                    Text(String(localized: "drawer_best_win"))
                                        .fontWeight(.regular)
                                        .font(.system(size: 12))
                                        .foregroundColor(AllInColors.grey600Color)
                                }
                                VStack(){
                                    Text("5")
                                        .fontWeight(.heavy)
                                        .font(.system(size: 15))
                                    Text(String(localized: "drawer_nb_friends"))
                                        .fontWeight(.regular)
                                        .font(.system(size: 12))
                                        .foregroundColor(AllInColors.grey600Color)
                                }
                            }
                        }
                        .padding(.leading, 10)
                    }
                    Text("Compte")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .padding(.leading, 13)
                        .padding(.top, 35)
                    
                    VStack(spacing: 0) {
                        ForEach(0..<parameters.count, id: \.self) { index in
                            HStack {
                                Image(systemName: parameters[index].icon)
                                    .foregroundColor(parameters[index].itemColor)
                                    .padding(.leading, 13)
                                Text(parameters[index].title)
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                    .foregroundColor(parameters[index].itemColor)
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .frame(width: 8, height: 12)
                                    .foregroundColor(parameters[index].itemColor)
                                    .padding(.trailing, 14)
                            }
                            .padding(.vertical, 15)
                            .background(parameters[index].backgroundColor)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .cornerRadius(7)
                    
                    Spacer()
                }
                .padding(.top, geometry.size.width*0.15)
                .padding(.horizontal, 20)
            }
            .edgesIgnoringSafeArea(.bottom).background(AllInColors.backgroundColor)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(showMenu: .constant(false))
    }
}
