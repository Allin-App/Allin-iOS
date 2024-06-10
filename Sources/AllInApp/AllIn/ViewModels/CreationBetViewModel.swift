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
    @Published var isPrivate = false {
        didSet {
            invited.removeAll()
        }
    }
    @Published var endRegisterDate = Date()
    @Published var endBetDate = Date()
    @Published var betAdded = false
    @Published var selectedTypeBet = 0 {
        didSet {
            values.removeAll()
            groupedItems.removeAll()
            response = ""
        }
    }
    @Published var values: [String] = []
    @Published var invited: Set<String> = []
    
    @Published var themeFieldError: String?
    @Published var descriptionFieldError: String?
    @Published var endRegisterDateFieldError: String?
    @Published var endBetDateFieldError: String?
    @Published var responsesFieldError: String?
    
    @Published var errorMessage: String?
    @Published var showErrorMessage = false
    
    @Published var friends: [User] = []
    
    let options: [(Int, String, String)] = [
        (0, "questionMarkIcon", String(localized: "bet_type_binary")),
        (1, "footballIcon", String(localized: "bet_type_match")),
        (2, "paintbrushIcon", String(localized: "bet_type_custom"))
    ]
    
    @Published var response = ""
    @Published var groupedItems: [[String]] = [[String]] ()
    
    init() {
        getFriends()
    }
    
    func getFriends() {
        manager.getFriends() { friends in
            DispatchQueue.main.async {
                self.friends = friends
            }
        }
    }
    
    func create() {
        
        guard checkAndSetError(forTheme: true, forDescription: true, forEndRegisterDate: true, forEndBetDate: true, forResponse: true) else {
            return
        }
        
        resetAllFieldErrors()
        
        if let user = AppStateContainer.shared.user {
            manager.addBet(bet: toBet(theme: theme, description: description, endRegister: endRegisterDate, endBet: endBetDate, isPrivate: isPrivate, status: .inProgress, creator: user.username, invited: Array(invited), type: selectedTypeBet)) { statusCode in
                print(statusCode)
                switch statusCode {
                case 201:
                    self.betAdded = true
                    let notificationItem = NotificationItem(title: String(localized: "notification_title_end_bet_date"), content: String(localized: "notification_subtitle_end_bet_date \(self.theme)"), interval: self.endBetDate.timeIntervalSinceNow)
                    
                    AppStateContainer.shared.notificationState.scheduleNotification(with: notificationItem)
                default:
                    self.setErrorMessage(errorMessage: String(localized: "network_error_text"))
                }
            }
        }
    }
    
    func checkAndSetError(forTheme checkTheme: Bool, forDescription checkDescription: Bool, forEndRegisterDate checkEndRegisterDate: Bool, forEndBetDate checkEndBetDate: Bool, forResponse checkResponse: Bool) -> Bool {
        
        var newThemeFieldError: String?
        var newDescriptionFieldError: String?
        var newEndRegisterDateFieldError: String?
        var newEndBetDateFieldError: String?
        var newResponsesFieldError: String?
        
        var hasError = false
        
        // Theme
        if checkTheme, theme.isEmpty {
            newThemeFieldError = String(localized: "field_error_mandatory")
            hasError = true
        }
        
        // Description
        if checkDescription, description.isEmpty {
            newDescriptionFieldError = String(localized: "field_error_mandatory")
            hasError = true
        }
        
        // End Register Date
        if checkEndRegisterDate, endRegisterDate < Date() {
            newEndRegisterDateFieldError = String(localized: "bet_creation_error_past_date")
            hasError = true
        }
        
        // End Bet Date
        if checkEndBetDate, endBetDate < endRegisterDate {
            newEndBetDateFieldError = String(localized: "bet_creation_error_date_order")
            hasError = true
        }
        
        if checkResponse, selectedTypeBet == 2 {
            if values.count < 2 {
                newResponsesFieldError = "Il doit y'avoir 2 réponses minimum"
                hasError = true
            } else {
                let uniqueValues = Set(values)
                if uniqueValues.count != values.count {
                    newResponsesFieldError = "Les réponses doivent être uniques"
                    hasError = true
                }
            }
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
            responsesFieldError = newResponsesFieldError
        }
        return false
    }
    
    func resetAllFieldErrors() {
        withAnimation {
            themeFieldError = nil
            descriptionFieldError = nil
            endRegisterDateFieldError = nil
            endBetDateFieldError = nil
            responsesFieldError = nil
        }
    }
    
    func setErrorMessage(errorMessage: String) {
        self.showErrorMessage = true
        self.errorMessage = errorMessage
    }
    
    func toBet(theme: String, description: String, endRegister: Date, endBet: Date, isPrivate: Bool, status: BetStatus, creator: String, invited: [String], type: Int) -> Bet {
        switch type {
        case 0:
            return BinaryBet(theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, isPrivate: isPrivate, status: status, invited: invited, author: creator)
        case 1:
            return MatchBet(theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, isPrivate: isPrivate, status: status, invited: invited, author: creator, nameTeam1: "", nameTeam2: "")
        case 2:
            var bet = CustomBet(theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, isPrivate: isPrivate, status: status, invited: invited, author: creator)
            for answer in values {
                bet.addCustomResponse(answer)
            }
            return bet
        default:
            return BinaryBet(theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, isPrivate: isPrivate, status: status, invited: invited, author: creator)
        }
    }
}
