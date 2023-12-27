//
//  RegisterViewModel.swift
//  AllIn
//
//  Created by Emre on 20/12/2023.
//

import Foundation
import SwiftUI

class RegisterViewModel: ObservableObject {
    
    @Inject var authService: IAuthService
    @Published var registerUsername: String = ""
    @Published var registerEmail: String = ""
    @Published var registerPassword: String = ""
    @Published var registerConfirmPassword: String = ""
    
    @Published var registerUsernameFieldError: String?
    @Published var registerEmailFieldError: String?
    @Published var registerPasswordFieldError: String?
    @Published var registerConfirmPasswordFieldError: String?
    
    @Published var errorMessage: String?
    @Published var showErrorMessage = false
    
    func register() {
        
        guard checkAndSetError(forUsername: true, forEmail: true, forPassword: true, forConfirmPassword: true) else {
            return
        }
        
        self.showErrorMessage = false
        resetAllFieldErrors()
        
        authService.register(username: registerUsername, email: registerEmail, password: registerPassword) { statusCode in
            switch statusCode {
            case 201:
                self.onRegisterSuccess()
            case 409:
                AppStateContainer.shared.loggedState.connectedUser = false
                self.setErrorMessage(errorMessage: "Email ou pseudo déjà utilisé.")
            default:
                AppStateContainer.shared.loggedState.connectedUser = false
                self.setErrorMessage(errorMessage: "La connexion a échoué. Veuillez réessayer.")
            }
        }
    }
    
    private func onRegisterSuccess() {
        AppStateContainer.shared.loggedState.connectedUser = true
    }
    
    func checkAndSetError(forUsername checkUsername: Bool, forEmail checkEmail: Bool, forPassword checkPassword: Bool, forConfirmPassword checkConfirmPassword: Bool) -> Bool {
        var newRegisterUsernameFieldError: String?
        var newRegisterEmailFieldError: String?
        var newRegisterPasswordFieldError: String?
        var newRegisterConfirmPasswordFieldError: String?
        var hasError = false
        
        // Username
        if checkUsername, registerUsername.isEmpty {
            newRegisterUsernameFieldError = "Veuillez saisir votre pseudo."
            hasError = true
        }
        
        // Email
        if checkEmail, registerEmail.isEmpty {
            newRegisterEmailFieldError = "Veuillez saisir votre email."
            hasError = true
        }
        
        if checkEmail, isValidEmail(email: registerEmail) {
            newRegisterEmailFieldError = "Veuillez saisir un email valide."
            hasError = true
        }
        
        // Password
        if checkPassword, registerPassword.isEmpty {
            newRegisterPasswordFieldError = "Veuillez saisir votre mot de passe."
            hasError = true
        }
        
        // Confirm password
        if checkConfirmPassword, registerConfirmPassword.isEmpty {
            newRegisterConfirmPasswordFieldError = "Veuillez confirmer votre mot de passe."
            hasError = true
        }
        
        if checkConfirmPassword, registerConfirmPassword != registerPassword {
            newRegisterConfirmPasswordFieldError = "Les mots de passe ne sont pas identiques."
            hasError = true
        }
        
        if !hasError {
            // No error
            return true
        }
        
        withAnimation {
            registerUsernameFieldError = newRegisterUsernameFieldError
            registerEmailFieldError = newRegisterEmailFieldError
            registerPasswordFieldError = newRegisterPasswordFieldError
            registerConfirmPasswordFieldError = newRegisterConfirmPasswordFieldError
        }
        return false
    }
    
    func resetAllFieldErrors() {
        withAnimation {
            registerUsernameFieldError = nil
            registerEmailFieldError = nil
            registerPasswordFieldError = nil
            registerConfirmPasswordFieldError = nil
        }
    }
    
    func setErrorMessage(errorMessage: String) {
        self.showErrorMessage = true
        self.errorMessage = errorMessage
    }
    
    func isValidEmail(email: String) -> Bool
    {
        return email.range(of:"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) == nil
    }
}
