//
//  LoginView.swift
//  AllIn
//
//  Created by Emre on 25/09/2023.
//

import SwiftUI

struct LoginView: View {
    
    enum Field {
        case email
        case password
    }
    
    @StateObject private var viewModel = LoginViewModel()
    @FocusState private var focusedField: Field?
    @State private var isPasswordVisible = true
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 15) {
                
                Spacer()
                Text("Te revoilà!")
                    .textStyle(weight: .semibold, color: AllInColors.darkBlueColor, size: 40)
                Text("Bon retour parmis nous tu nous as manqué!")
                    .textStyle(weight: .regular, color: AllInColors.darkBlueColor, size: 20)
                    .frame(width: 220)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 60)
                    .submitLabel(.next)
                
                VStack {
                    if let identifierError = $viewModel.loginIdentifierFieldError.wrappedValue {
                        Text(identifierError)
                            .textStyle(weight: .bold, color: .red, size: 10)
                    }
                    TextField("", text: $viewModel.loginIdentifier, prompt: Text("Email").foregroundColor(.gray))
                        .padding()
                        .background(Color.white.cornerRadius(9))
                        .frame(width: 300)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 9, style: .continuous)
                                .stroke(AllInColors.blueGrey800Color, lineWidth: 1)
                        )
                        .autocapitalization(.none)
                        .padding(.bottom, 8)
                        .focused($focusedField, equals: .email)
                }
                
                VStack {
                    if let passwordError = $viewModel.loginPasswordFieldError.wrappedValue {
                        Text(passwordError)
                            .textStyle(weight: .bold, color: .red, size: 10)
                    }
                    Group {
                        if isPasswordVisible {
                            SecureField("", text: $viewModel.loginPassword, prompt: Text("Mot de passe").foregroundColor(.gray))
                        } else {
                            TextField("", text: $viewModel.loginPassword, prompt: Text("Mot de passe").foregroundColor(.gray))
                                .autocapitalization(.none)
                        }
                    }
                    .padding()
                    .background(Color.white.cornerRadius(9))
                    .frame(width: 300)
                    .overlay(
                        RoundedRectangle(cornerRadius: 9, style: .continuous)
                            .stroke(AllInColors.blueGrey800Color, lineWidth: 1)
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
                    .focused($focusedField, equals: .password)
                }
                
                Text("Mot de passe oublié?")
                    .textStyle(weight: .medium, color: AllInColors.darkBlueColor, size: 14)
                    .frame(alignment: .trailing)
                    .padding(.bottom, 20)
                    .padding(.leading, 150)
                
                Button(action: {
                    viewModel.login()
                }) {
                    Text("Se connecter")
                        .textStyle(weight: .bold, color: .white, size: 17)
                        .frame(width: 300, height: 60)
                        .background(LinearGradient(gradient:
                                                    Gradient(colors:[AllInColors.pinkAccentColor,AllInColors.purpleAccentColor,AllInColors.blueAccentColor]),
                                                   startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(13)
                }
                
                Spacer()
                HStack(spacing: 0) {
                    Text("Pas encore inscrit? ")
                        .textStyle(weight: .regular, color: AllInColors.darkBlueColor, size: 16)
                    NavigationLink(destination: RegisterView().navigationBarBackButtonHidden(true))
                    {
                        Text("S'inscrire")
                            .textStyle(weight: .semibold, color: AllInColors.darkPurpleColor, size: 16)
                    }
                }
                .padding(.bottom, 10)
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(AllInColors.startBackgroundColor)
            .onTapGesture {
                hideKeyboard()
            }
        }
        .alert(isPresented: $viewModel.showErrorMessage) {
            Alert(title: Text("Erreur de connexion"), message: Text(viewModel.errorMessage ?? ""), dismissButton: .default(Text("OK")))
        }
        .onSubmit {
            switch focusedField {
            case .email:
                focusedField = .password
            case .password:
                focusedField = nil
            default:
                focusedField = nil
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
