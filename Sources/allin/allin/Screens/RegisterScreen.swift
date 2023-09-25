//
//  RegisterScreen.swift
//  AllIn
//
//  Created by étudiant on 25/09/2023.
//

import SwiftUI

struct Register: View {
    
    @State private var pseudo: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var passwordConfirm: String = ""
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 15) {
                Spacer()
                Text("On a besoin de ça!")
                    .betTextStyle(weight: .semibold, color: AllinColor.StartTextColor, size: 40)
                Text("Promis c’est rapide.")
                    .frame(width: 220)
                    .multilineTextAlignment(.center)
                    .betTextStyle(weight: .regular, color: AllinColor.StartTextColor, size: 20)
                    .padding(.bottom, 60)
                
                TextField("", text: $pseudo, prompt: Text("Pseudo").foregroundColor(.gray))
                    .padding()
                    .background(Color.white.cornerRadius(9))
                    .frame(width: 300)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 9, style: .continuous)
                            .stroke(AllinColor.StrokeGrayColor, lineWidth: 1)
                    )
                    .padding(.bottom, 8)
                
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
                    .padding(.bottom, 8)
                
                TextField("", text: $passwordConfirm, prompt: Text("Confirmation du Mot de passe").foregroundColor(.gray))
                    .padding()
                    .background(Color.white.cornerRadius(9))
                    .frame(width: 300)
                    .overlay(
                        RoundedRectangle(cornerRadius: 9, style: .continuous)
                            .stroke(AllinColor.StrokeGrayColor, lineWidth: 1)
                    )
                    .foregroundColor(.black)
                    .padding(.bottom, 50)

                Button(action: {}) {
                    Text("S'inscrire")
                        .betTextStyle(weight: .bold, color: .white, size: 17)
                }
                .frame(width: 300, height: 60)
                .background(LinearGradient(gradient:
                                            Gradient(colors:[AllinColor.TopBarColorPink,AllinColor.TopBarColorPurple,AllinColor.TopBarColorBlue]),
                                           startPoint: .leading, endPoint: .trailing))
                .cornerRadius(13)
                
                Spacer()
                HStack(spacing: 0) {
                    Text("Tu as déjà un compte? ")
                        .betTextStyle(weight: .regular, color: AllinColor.StartTextColor, size: 16)
                    Text("Se connecter")
                        .betTextStyle(weight: .semibold, color: AllinColor.PurpleText, size: 16)
                }
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(AllinColor.StartBackground)
        }
    }
    
}
