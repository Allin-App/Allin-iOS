//
//  RegisterScreen.swift
//  AllIn
//
//  Created by étudiant on 25/09/2023.
//

import SwiftUI

struct Register: View {
    
    @State private var isPasswordVisible = true
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordConfirm: String = ""
    @State private var isRegisterSuccessful = false
    @State private var errorPassword = false
    @State private var errorMail = false
    @State private var errorUsername = false
    @State private var errorMailMessage: String = ""
    @State private var errorUsernameMessage: String = ""
    @State private var errorPasswordMessage: String = ""

    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    Spacer()
                    VStack {
                        if (username != "") {
                            Text("Bonjour "+username+",")
                                .betTextStyle(weight: .semibold, color: AllinColor.StartTextColor, size: 40)
                                .padding([.trailing, .leading], 30)
                        } else {
                            Text("Bonjour,")
                                .betTextStyle(weight: .semibold, color: AllinColor.StartTextColor, size: 40)
                                .lineLimit(1)
                                .padding([.trailing, .leading], 30)
                        }
                        Text("On a besoin de ça!")
                            .betTextStyle(weight: .semibold, color: AllinColor.StartTextColor, size: 40)
                    }
                    
                    Text("Promis c’est rapide.")
                        .frame(width: 220)
                        .multilineTextAlignment(.center)
                        .betTextStyle(weight: .regular, color: AllinColor.StartTextColor, size: 20)
                        .padding(.bottom, 60)
                    
                    VStack {
                        if errorUsername {
                            Text(errorUsernameMessage)
                                .font(.system(size: 10))
                                .foregroundColor(.red)
                                .fontWeight(.bold)
                        }
                        TextField("", text: $username, prompt: Text("Pseudo").foregroundColor(.gray))
                            .padding()
                            .background(Color.white.cornerRadius(9))
                            .frame(width: 300)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 9, style: .continuous)
                                    .stroke(AllinColor.StrokeGrayColor, lineWidth: 1)
                            )
                            .padding(.bottom, 8)
                            .onChange(of: username) { newValue in
                                        if newValue.count > 25 {
                                            username = String(newValue.prefix(25))
                                        }
                                    }
                    }
                    
                    VStack {
                        if errorMail {
                            Text(errorMailMessage)
                                .font(.system(size: 10))
                                .foregroundColor(.red)
                                .fontWeight(.bold)
                        }
                        TextField("", text: $email, prompt: Text("Email").foregroundColor(.gray))
                            .padding()
                            .background(Color.white.cornerRadius(9))
                            .frame(width: 300)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 9, style: .continuous)
                                    .stroke(AllinColor.StrokeGrayColor, lineWidth: 1)
                            )
                            .padding(.bottom, 8)
                            .onChange(of: email) { newValue in
                                        if newValue.count > 50 {
                                            email = String(newValue.prefix(50))
                                        }
                                    }
                    }
                    
                    VStack {
                        if errorPassword {
                            Text(errorPasswordMessage)
                                .font(.system(size: 10))
                                .foregroundColor(.red)
                                .fontWeight(.bold)
                        }
                        Group {
                            if isPasswordVisible {
                                SecureField("", text: $password, prompt: Text("Mot de passe").foregroundColor(.gray))
                            } else {
                                TextField("", text: $password, prompt: Text("Mot de passe").foregroundColor(.gray))
                                    .autocapitalization(.none)
                            }
                        }
                        .padding()
                        .background(Color.white.cornerRadius(9))
                        .frame(width: 300)
                        .overlay(
                            RoundedRectangle(cornerRadius: 9, style: .continuous)
                                .stroke(AllinColor.StrokeGrayColor, lineWidth: 1)
                        )
                        .foregroundColor(.black)
                        .padding(.bottom, 8)
                        .overlay(
                            HStack {
                                Spacer()
                                Button(action: {
                                    isPasswordVisible.toggle()
                                }) {
                                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                        .foregroundColor(.gray)
                                }
                                .padding(.bottom, 8)
                                .padding(.trailing, 8)
                            }
                        )
                    }
                    
                    VStack {
                        if errorPassword {
                            Text(errorPasswordMessage)
                                .font(.system(size: 10))
                                .foregroundColor(.red)
                                .fontWeight(.bold)
                        }
                        
                        Group {
                            if isPasswordVisible {
                                SecureField("", text: $passwordConfirm, prompt: Text("Confirmation du Mot de passe").foregroundColor(.gray))
                            } else {
                                TextField("", text: $passwordConfirm, prompt: Text("Confirmation du Mot de passe").foregroundColor(.gray))
                                    .autocapitalization(.none)
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
                        .padding(.bottom, 50)
                    }
                    Button(action: {
                        register(email: email, username: username, password: password, confirmPassword: passwordConfirm)
                    }) {
                        Text("S'inscrire")
                            .betTextStyle(weight: .bold, color: .white, size: 17)
                    }
                    .frame(width: 300, height: 60)
                    .background(LinearGradient(gradient:
                                                Gradient(colors:[AllinColor.TopBarColorPink,AllinColor.TopBarColorPurple,AllinColor.TopBarColorBlue]),
                                               startPoint: .leading, endPoint: .trailing))
                    .background(
                        NavigationLink("", destination: Home(page: "Bet").navigationBarBackButtonHidden(true), isActive: $isRegisterSuccessful)
                            .opacity(0)
                    )
                    .cornerRadius(13)
                    
                    Spacer()
                    
                    HStack(spacing: 0) {
                        Text("Tu as déjà un compte? ")
                            .betTextStyle(weight: .regular, color: AllinColor.StartTextColor, size: 16)
                        NavigationLink(destination: Login().navigationBarBackButtonHidden(true))
                        {
                            Text("Se connecter")
                                .betTextStyle(weight: .semibold, color: AllinColor.PurpleText, size: 16)
                        }
                    }
                    
                }

            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(AllinColor.StartBackground)
        }
    }
    
    func register(email: String, username: String, password: String, confirmPassword: String) {
        cleanError()
        if password != confirmPassword {
            errorPassword = true
            errorPasswordMessage = "Les mots de passes doivent être identiques."
            return
        }
        if username.isEmpty {
            errorUsername = true
            errorUsernameMessage = "Le pseudo ne peut pas être vide."
            return
        }
        
        if email.isEmpty {
            errorMail = true
            errorMailMessage = "Le mail ne peut pas être vide."
            return
        }
        
        if password.isEmpty || confirmPassword.isEmpty {
            errorPassword = true
            errorPasswordMessage = "Veuillez renseigner le mot de passe sur les deux champs."
            return
        }
        
        if isValidEmail(email: email) {
            errorMail = true
            errorMailMessage = "L'adresse e-mail n'est pas valide."
            return
        }
        
        let api = AuthService()
        api.register(email: email, password: password, username: username) { statusCode in
            DispatchQueue.main.async {
                if statusCode == 201 {
                    isRegisterSuccessful = true
                } else {

                }
            }
        }
    }
    
    func isValidEmail(email: String) -> Bool
    {
        if(email.range(of:"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil) {
            return false
        } else {
            return true
        }
    }
    
    func cleanError() {
        errorPassword = false
        errorMail = false
        errorUsername = false
    }
    
}
