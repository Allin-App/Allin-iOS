//
//  LoginScreen.swift
//  AllIn
//
//  Created by étudiant on 24/09/2023.
//

import SwiftUI

struct Login: View {
    
    @State private var isPasswordVisible = true
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showErrorAlert = false
    @State private var errorAlertMessage = ""
    @State private var isLoginSuccessful = false

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
                    .autocapitalization(.none)
                    .padding(.bottom, 8)
                
                Group {
                    if isPasswordVisible {
                        SecureField("", text: $password, prompt: Text("Mot de passe").foregroundColor(.gray))
                    } else {
                        TextField("", text: $password, prompt: Text("Mot de passe").foregroundColor(.gray))
                    }
                }
                .padding()
                .background(Color.white.cornerRadius(9))
                .frame(width: 300)
                .overlay(
                    RoundedRectangle(cornerRadius: 9, style: .continuous)
                        .stroke(AllinColor.StrokeGrayColor, lineWidth: 1)
                )
                .overlay(
                    HStack {
                        Spacer()
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 8)
                    }
                )
                .foregroundColor(.black)
                
                Text("Mot de passe oublié?")
                    .frame(alignment: .trailing)
                    .padding(.bottom, 20)
                    .padding(.leading, 150)
                    .betTextStyle(weight: .medium, color: AllinColor.StartTextColor, size: 14)
                
                Button(action: {
                        login(email: username, password: password)
                    }) {
                    Text("Se connecter")
                        .betTextStyle(weight: .bold, color: .white, size: 17)
                        .frame(width: 300, height: 60)
                        .background(LinearGradient(gradient:
                                                    Gradient(colors:[AllinColor.TopBarColorPink,AllinColor.TopBarColorPurple,AllinColor.TopBarColorBlue]),
                                                   startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(13)
                }
                .background(
                    NavigationLink("", destination: Home(page: "Bet").navigationBarBackButtonHidden(true), isActive: $isLoginSuccessful)
                        .opacity(0)
                )
                
                Spacer()
                HStack(spacing: 0) {
                    Text("Pas encore inscrit? ")
                        .betTextStyle(weight: .regular, color: AllinColor.StartTextColor, size: 16)
                    NavigationLink(destination: Register().navigationBarBackButtonHidden(true))
                    {
                        Text("S'inscrire")
                            .betTextStyle(weight: .semibold, color: AllinColor.PurpleText, size: 16)
                    }
                }
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(AllinColor.StartBackground)
        }
        .alert(isPresented: $showErrorAlert) {
            Alert(title: Text("Erreur de connexion"), message: Text(errorAlertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    func login(email: String, password: String) {
        let api = AuthService()

        api.login(email: email, password: password) { statusCode in
            DispatchQueue.main.async {
                if statusCode == 200 {
                    isLoginSuccessful = true
                } else {
                    errorAlertMessage = "La connexion a échoué. Veuillez réessayer."
                    showErrorAlert = true
                }
            }
        }
    }
}


