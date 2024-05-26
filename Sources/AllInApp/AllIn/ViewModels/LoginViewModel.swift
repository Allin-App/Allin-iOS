//
//  LoginViewModel.swift
//  AllIn
//
//  Created by Emre on 17/12/2023.
//

import Foundation
import SwiftUI
import DependencyInjection

class LoginViewModel: ObservableObject {
    
    @Inject var authService: IAuthService
    @Published var loginIdentifier: String = ""
    @Published var loginPassword: String = ""
    
    @Published var loginIdentifierFieldError: String?
    @Published var loginPasswordFieldError: String?
    
    @Published var errorMessage: String?
    @Published var showErrorMessage = false
    
    func login() {
        
        guard checkAndSetError(forLogin: true, forPassword: true) else {
            return
        }
        
        self.showErrorMessage = false
        resetAllFieldErrors()
        
        authService.login(login: loginIdentifier, password: loginPassword) { statusCode in
            switch statusCode {
            case 200:
                self.onLoginSuccess()
            case 404:
                AppStateContainer.shared.loggedState.connectedUser = false
                self.setErrorMessage(errorMessage: String(localized: "login_bad_credentials"))
            default:
                AppStateContainer.shared.loggedState.connectedUser = false
                self.setErrorMessage(errorMessage: String(localized: "login_error_content"))
            }
        }
    }
    
    private func onLoginSuccess() {
        AppStateContainer.shared.loggedState.connectedUser = true
    }
    
    func checkAndSetError(forLogin checkLogin: Bool, forPassword checkPassword: Bool) -> Bool {
        var newLoginIdentifierFieldError: String?
        var newLoginPasswordFieldError: String?
        var hasError = false
        
        // Login
        if checkLogin, loginIdentifier.isEmpty {
            newLoginIdentifierFieldError = String(localized: "field_error_mandatory")
            hasError = true
        }
        
        // Password
        if checkPassword, loginPassword.isEmpty {
            newLoginPasswordFieldError = String(localized: "field_error_mandatory")
            hasError = true
        }
        
        if !hasError {
            // No error
            return true
        }
        
        withAnimation {
            loginIdentifierFieldError = newLoginIdentifierFieldError
            loginPasswordFieldError = newLoginPasswordFieldError
        }
        return false
    }
    
    func resetAllFieldErrors() {
        withAnimation {
            loginIdentifierFieldError = nil
            loginPasswordFieldError = nil
        }
    }
    
    func setErrorMessage(errorMessage: String) {
        self.showErrorMessage = true
        self.errorMessage = errorMessage
    }
}
