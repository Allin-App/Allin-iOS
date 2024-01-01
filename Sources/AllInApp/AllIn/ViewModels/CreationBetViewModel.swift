//
//  CreationBetViewModel.swift
//  AllIn
//
//  Created by Emre on 30/12/2023.
//

import Foundation
import SwiftUI
import DependencyInjection
import ViewModel

class CreationBetViewModel: ObservableObject {
    
    @Inject var manager: ManagerVM
    @Published var theme: String = ""
    @Published var description: String = ""
    @Published var isPublic = true
    @Published var endRegisterDate = Date()
    @Published var endBetDate = Date()
    
    @Published var themeFieldError: String?
    @Published var descriptionFieldError: String?
    @Published var endRegisterDateFieldError: String?
    @Published var endBetDateFieldError: String?
    
    func create() {
        manager.addBet()
    }
    
    func checkAndSetError(forLogin checkLogin: Bool, forPassword checkPassword: Bool) -> Bool {
        /*var newLoginIdentifierFieldError: String?
        var newLoginPasswordFieldError: String?
        var hasError = false
        
        // Login
        if checkLogin, loginIdentifier.isEmpty {
            newLoginIdentifierFieldError = "Veuillez saisir votre identifiant."
            hasError = true
        }
        
        // Password
        if checkPassword, loginPassword.isEmpty {
            newLoginPasswordFieldError = "Veuillez saisir votre mot de passe."
            hasError = true
        }
        
        if !hasError {
            // No error
            return true
        }
        
        withAnimation {
            loginIdentifierFieldError = newLoginIdentifierFieldError
            loginPasswordFieldError = newLoginPasswordFieldError
        }*/
        return false
    }
    
    func resetAllFieldErrors() {
        withAnimation {
            themeFieldError = nil
            descriptionFieldError = nil
            endRegisterDateFieldError = nil
            endBetDateFieldError = nil
        }
    }
}
