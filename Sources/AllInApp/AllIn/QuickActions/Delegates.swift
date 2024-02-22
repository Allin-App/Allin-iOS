//
//  Delegates.swift
//  AllIn
//
//  Created by Emre KARTAL on 22/02/2024.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        if let selectedAction = options.shortcutItem {
            QuickAction.selectedAction = selectedAction
        }
        let sceneConfiguration = UISceneConfiguration(name: "Quick Action Scene", sessionRole: connectingSceneSession.role)
        sceneConfiguration.delegateClass = QuickActionSceneDelegate.self
        return sceneConfiguration
    }
}

class QuickActionSceneDelegate: UIResponder, UIWindowSceneDelegate {
    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        QuickAction.selectedAction = shortcutItem
    }
}
