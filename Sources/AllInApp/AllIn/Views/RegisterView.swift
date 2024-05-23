//
//  RegisterView.swift
//  AllIn
//
//  Created by Emre on 25/09/2023.
//

import SwiftUI

struct RegisterView: View {
    
    enum Field {
        case username
        case email
        case password
        case passwordConfirm
    }
    
    @StateObject private var viewModel = RegisterViewModel()
    @FocusState private var focusedField: Field?
    @State private var isPasswordVisible = true
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    Spacer()
                    VStack {
                        if !viewModel.registerUsername.isEmpty {
                            Text("register_hello \(viewModel.registerUsername)")
                                .textStyle(weight: .semibold, color: AllInColors.darkBlueColor, size: 40)
                                .padding([.trailing, .leading], 30)
                        } else {
                            Text("register_hello")
                                .textStyle(weight: .semibold, color: AllInColors.darkBlueColor, size: 40)
                        }
                        Text("register_title")
                            .textStyle(weight: .semibold, color: AllInColors.darkBlueColor, size: 40)
                    }
                    
                    Text("register_subtitle")
                        .textStyle(weight: .regular, color: AllInColors.darkBlueColor, size: 20)
                        .frame(width: 220)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 60)
                    
                    VStack {
                        if let usernameError = $viewModel.registerUsernameFieldError.wrappedValue {
                            Text(usernameError)
                                .textStyle(weight: .bold, color: .red, size: 10)
                        }
                        TextField("", text: $viewModel.registerUsername, prompt: Text("generic_username").foregroundColor(.gray))
                            .padding()
                            .background(Color.white.cornerRadius(9))
                            .frame(width: 300)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 9, style: .continuous)
                                    .stroke(AllInColors.blueGrey800Color, lineWidth: 1)
                            )
                            .padding(.bottom, 8)
                            .autocorrectionDisabled(true)
                            .onChange(of: viewModel.registerUsername, perform: { value in
                                guard value != viewModel.registerUsername else { return }
                                if value.count > 25 {
                                    viewModel.registerUsername = String(value.prefix(25))
                                }
                            })
                            .focused($focusedField, equals: .username)
                            .submitLabel(.next)
                    }
                    
                    VStack {
                        if let emailError = $viewModel.registerEmailFieldError.wrappedValue {
                            Text(emailError)
                                .textStyle(weight: .bold, color: .red, size: 10)
                        }
                        TextField("", text: $viewModel.registerEmail, prompt: Text("generic_email").foregroundColor(.gray))
                            .padding()
                            .keyboardType(.emailAddress)
                            .background(Color.white.cornerRadius(9))
                            .frame(width: 300)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 9, style: .continuous)
                                    .stroke(AllInColors.blueGrey800Color, lineWidth: 1)
                            )
                            .padding(.bottom, 8)
                            .autocorrectionDisabled(true)
                            .onChange(of: viewModel.registerEmail, perform: { value in
                                guard value != viewModel.registerEmail else { return }
                                if value.count > 50 {
                                    viewModel.registerEmail = String(value.prefix(50))
                                }
                            })
                            .focused($focusedField, equals: .email)
                            .textContentType(.emailAddress)
                            .submitLabel(.next)
                    }
                    
                    VStack {
                        if let passwordError = $viewModel.registerPasswordFieldError.wrappedValue {
                            Text(passwordError)
                                .font(.system(size: 10))
                                .foregroundColor(.red)
                                .fontWeight(.bold)
                        }
                        Group {
                            if isPasswordVisible {
                                SecureField("", text: $viewModel.registerPassword, prompt: Text("generic_password").foregroundColor(.gray))
                            } else {
                                TextField("", text: $viewModel.registerPassword, prompt: Text("generic_password").foregroundColor(.gray))
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
                        .focused($focusedField, equals: .password)
                    }
                    
                    VStack {
                        if let passwordConfirmError = $viewModel.registerConfirmPasswordFieldError.wrappedValue {
                            Text(passwordConfirmError)
                                .font(.system(size: 10))
                                .foregroundColor(.red)
                                .fontWeight(.bold)
                        }
                        
                        Group {
                            if isPasswordVisible {
                                SecureField("", text: $viewModel.registerConfirmPassword, prompt: Text("register_confirm_password").foregroundColor(.gray))
                            } else {
                                TextField("", text: $viewModel.registerConfirmPassword, prompt: Text("register_confirm_password").foregroundColor(.gray))
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
                        .padding(.bottom, 50)
                        .focused($focusedField, equals: .passwordConfirm)
                        .submitLabel(.next)
                    }
                    
                    Button(action: {
                        viewModel.register()
                    }) {
                        Text("generic_register")
                            .textStyle(weight: .bold, color: .white, size: 17)
                        
                            .frame(width: 300, height: 60)
                            .background(LinearGradient(gradient:
                                                        Gradient(colors:[AllInColors.pinkAccentColor,AllInColors.purpleAccentColor,AllInColors.blueAccentColor]),
                                                       startPoint: .bottomLeading, endPoint: .topTrailing))
                            .background(
                                .opacity(0)
                            )
                            .cornerRadius(13)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Text("generic_already_have_account")
                            .textStyle(weight: .regular, color: AllInColors.darkBlueColor, size: 16)
                        
                        NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true))
                        {
                            Text("generic_login")
                                .textStyle(weight: .semibold, color: AllInColors.darkPurpleColor, size: 16)
                        }
                    }
                    .padding(.bottom, 10)
                    
                }
                .frame(minWidth: geometry.size.width, minHeight: geometry.size.height)
                .onTapGesture {
                    hideKeyboard()
                }
                
            }
            .alert(isPresented: $viewModel.showErrorMessage) {
                Alert(title: Text("Erreur lors de l'enregistrement"), message: Text(viewModel.errorMessage ?? ""), dismissButton: .default(Text("generic_ok")))
            }
            .background(AllInColors.startBackgroundColor)
            .onSubmit {
                switch focusedField {
                case .username:
                    focusedField = .email
                case .email:
                    focusedField = .password
                case .password:
                    focusedField = .passwordConfirm
                case .passwordConfirm:
                    focusedField = nil
                default:
                    focusedField = nil
                }
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .preferredColorScheme(.dark)
    }
}
