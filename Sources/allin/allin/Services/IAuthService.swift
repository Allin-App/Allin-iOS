//
//  IAuthService.swift
//  AllIn
//
//  Created by étudiant on 28/10/2023.
//

import Foundation

protocol IAuthService {
    func login(email : String, password : String, completion : @escaping (Int)-> ())
    func register(email : String, password : String, username : String, completion : @escaping (Int)-> ())
}
