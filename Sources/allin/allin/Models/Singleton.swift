//
//  Singleton.swift
//  AllIn
//
//  Created by étudiant on 11/10/2023.
//

import Foundation

class Singleton {
    
    static let singleton = Singleton()
    
    var user: User?
    
    var auth: AuthService = AuthService()
    
    private init() { }
}
