//
//  IAuthService.swift
//  AllIn
//
//  Created by Emre on 28/10/2023.
//

import Foundation

protocol IAuthService {
    func login(login: String, password: String, completion : @escaping (Int)-> ())
    func register(username: String, email: String, password: String, completion : @escaping (Int)-> ())
    func refreshAuthentication(completion: @escaping (Int) -> ())
}
