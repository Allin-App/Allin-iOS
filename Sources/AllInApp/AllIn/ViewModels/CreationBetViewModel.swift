//
//  CreationBetViewModel.swift
//  AllIn
//
//  Created by Emre on 30/12/2023.
//

import Foundation
import SwiftUI
import DependencyInjection
import Model

class CreationBetViewModel: ObservableObject {
    
    @Inject var manager: Manager
    @Published var theme: String = ""
    @Published var description: String = ""
    @Published var isPublic = true
    @Published var endRegisterDate = Date()
    @Published var endBetDate = Date()
    @Published var betAdded = false
    @Published var selectedOption = 0
    
    @Published var themeFieldError: String?
    @Published var descriptionFieldError: String?
    @Published var endRegisterDateFieldError: String?
    @Published var endBetDateFieldError: String?
    
    @Published var errorMessage: String?
    @Published var showErrorMessage = false
    
    func create() {
        
        guard checkAndSetError(forTheme: true, forDescription: true, forEndRegisterDate: true, forEndBetDate: true) else {
            return
        }
        
        resetAllFieldErrors()
        
        if let user = AppStateContainer.shared.user {
            manager.addBet(bet: toBet(theme: theme, description: description, endRegister: endRegisterDate, endBet: endBetDate, isPublic: isPublic, status: .inProgress, creator: user.username, type: selectedOption)) { statusCode in
                switch statusCode {
                case 201:
                    self.betAdded = true
                    let notificationItem = NotificationItem(title: "Qui seront les vainqueurs ?", content: "Le pari \"\(self.theme)\" a atteint sa date limite. Rendez-vous dans l'application pour renseigner la réponse gagnante.", interval: self.endBetDate.timeIntervalSinceNow)
                    
                    AppStateContainer.shared.notificationState.scheduleNotification(with: notificationItem)
                default:
                    self.setErrorMessage(errorMessage: "Problème de connexion. Veuillez réessayer ultérieurement.")
                }
            }
        }
    }
    
    func checkAndSetError(forTheme checkTheme: Bool, forDescription checkDescription: Bool, forEndRegisterDate checkEndRegisterDate: Bool, forEndBetDate checkEndBetDate: Bool) -> Bool {
        
        var newThemeFieldError: String?
        var newDescriptionFieldError: String?
        var newEndRegisterDateFieldError: String?
        var newEndBetDateFieldError: String?
        
        var hasError = false
        
        // Theme
        if checkTheme, theme.isEmpty {
            newThemeFieldError = "Veuillez saisir le thème."
            hasError = true
        }
        
        // Description
        if checkDescription, description.isEmpty {
            newDescriptionFieldError = "Veuillez saisir la description."
            hasError = true
        }
        
        // End Register Date
        if checkEndRegisterDate, endRegisterDate < Date() {
            newEndRegisterDateFieldError = "La date de fin des inscriptions doit être ultérieure à la date actuelle."
            hasError = true
        }
        
        // End Bet Date
        if checkEndBetDate, endBetDate < endRegisterDate {
            newEndBetDateFieldError = "La date de fin des paris doit être ultérieure à la date de fin des inscriptions."
            hasError = true
        }
        
        if !hasError {
            // No error
            return true
        }
        
        withAnimation {
            themeFieldError = newThemeFieldError
            descriptionFieldError = newDescriptionFieldError
            endRegisterDateFieldError = newEndRegisterDateFieldError
            endBetDateFieldError = newEndBetDateFieldError
        }
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
    
    func setErrorMessage(errorMessage: String) {
        self.showErrorMessage = true
        self.errorMessage = errorMessage
    }
    
    func toBet(theme: String, description: String, endRegister: Date, endBet: Date, isPublic: Bool, status: BetStatus, creator: String, type: Int) -> Bet {
        switch type {
        case 0:
            return BinaryBet(theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, isPublic: isPublic, status: status, invited: [], author: creator, registered: [])
        case 1:
            return MatchBet(theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, isPublic: isPublic, status: status, invited: [], author: creator, registered: [], nameTeam1: "", nameTeam2: "")
        case 2:
            return CustomBet(theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, isPublic: isPublic, status: status, invited: [], author: creator, registered: [])
        default:
            return BinaryBet(theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, isPublic: isPublic, status: status, invited: [], author: creator, registered: [])
        }
    }
}
