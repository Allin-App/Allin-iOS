//
//  LoginScreen.swift
//  AllIn
//
//  Created by étudiant on 24/09/2023.
//

import SwiftUI

struct Login: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 15) {
                Spacer()
                Text("Te revoilà!")
                    .betTextStyle(weight: .semibold, color: AllinColor.StartTextColor, size: 40)
                Text("Bon retour parmis nous tu nous as manqué!")
                    .frame(width: 220)
                    .multilineTextAlignment(.center)
                    .betTextStyle(weight: .regular, color: AllinColor.StartTextColor, size: 20)
                    .padding(.bottom, 60)
                
                TextField("", text: $username, prompt: Text("Email").foregroundColor(.gray))
                    .padding()
                    .background(Color.white.cornerRadius(9))
                    .frame(width: 300)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 9, style: .continuous)
                            .stroke(AllinColor.StrokeGrayColor, lineWidth: 1)
                    )
                    .padding(.bottom, 8)
                
                TextField("", text: $password, prompt: Text("Mot de passe").foregroundColor(.gray))
                    .padding()
                    .background(Color.white.cornerRadius(9))
                    .frame(width: 300)
                    .overlay(
                        RoundedRectangle(cornerRadius: 9, style: .continuous)
                            .stroke(AllinColor.StrokeGrayColor, lineWidth: 1)
                    )
                    .foregroundColor(.black)
                
                Text("Mot de passe oublié?")
                    .frame(alignment: .trailing)
                    .padding(.bottom, 20)
                    .padding(.leading, 150)
                    .betTextStyle(weight: .medium, color: AllinColor.StartTextColor, size: 14)

                Button(action: {}) {
                    Text("Se connecter")
                        .betTextStyle(weight: .bold, color: .white, size: 17)
                }
                .frame(width: 300, height: 60)
                .background(LinearGradient(gradient:
                                            Gradient(colors:[AllinColor.TopBarColorPink,AllinColor.TopBarColorPurple,AllinColor.TopBarColorBlue]),
                                           startPoint: .leading, endPoint: .trailing))
                .cornerRadius(13)
                
                Spacer()
                HStack(spacing: 0) {
                    Text("Pas encore inscrit? ")
                        .betTextStyle(weight: .regular, color: AllinColor.StartTextColor, size: 16)
                    Text("S'inscrire")
                        .betTextStyle(weight: .semibold, color: AllinColor.PurpleText, size: 16)
                }
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(AllinColor.StartBackground)
        }
    }
    
}

