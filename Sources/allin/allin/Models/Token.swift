//
//  Token.swift
//  AllIn
//
//  Created by Emre on 17/12/2023.
//

import Foundation

struct TokenManager {
    
    static let shared = TokenManager()

    private let tokenKey = "AuthToken"

    func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: tokenKey)
    }

    func getToken() -> String? {
        return UserDefaults.standard.string(forKey: tokenKey)
    }

    func deleteToken() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
}
