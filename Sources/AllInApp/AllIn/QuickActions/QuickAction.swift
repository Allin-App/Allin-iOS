//
//  QuickAction.swift
//  AllIn
//
//  Created by Emre on 22/02/2024.
//

import UIKit

enum QuickAction {
    static var selectedAction: UIApplicationShortcutItem?
    
    static var homeuserInfo: [String : NSSecureCoding] {
        ["name" : "Bet" as NSSecureCoding]
    }
    
    static var createuserInfo: [String : NSSecureCoding] {
        ["name" : "CreationBet" as NSSecureCoding]
    }
    
    static var frienduserInfo: [String : NSSecureCoding] {
        ["name" : "Friends" as NSSecureCoding]
    }
    
    static var rankuserInfo: [String : NSSecureCoding] {
        ["name" : "Ranking" as NSSecureCoding]
    }
    
    static var allShortcutItems: [UIApplicationShortcutItem] = {
        var shortcuts: [UIApplicationShortcutItem] = []
        
        if AppStateContainer.shared.loggedState.connectedUser {
            shortcuts.append(UIApplicationShortcutItem(type: "home", localizedTitle: "Coins : " + String(AppStateContainer.shared.user?.nbCoins ?? 0), localizedSubtitle: "", icon: UIApplicationShortcutIcon(templateImageName: "allCoinBlackIcon"), userInfo: homeuserInfo))
        }
        
        shortcuts.append(contentsOf: [
            UIApplicationShortcutItem(type: "create", localizedTitle: "Créer un pari", localizedSubtitle: "", icon: UIApplicationShortcutIcon(systemImageName: "pencil.circle"), userInfo: createuserInfo),
            UIApplicationShortcutItem(type: "friend", localizedTitle: "Voir mes amis", localizedSubtitle: "", icon: UIApplicationShortcutIcon(systemImageName: "person.2.square.stack"), userInfo: frienduserInfo),
            UIApplicationShortcutItem(type: "ranking", localizedTitle: "Classement", localizedSubtitle: "Où en suis-je ?", icon: UIApplicationShortcutIcon(systemImageName: "rosette"), userInfo: rankuserInfo)
        ])
        
        return shortcuts
    }()
}
