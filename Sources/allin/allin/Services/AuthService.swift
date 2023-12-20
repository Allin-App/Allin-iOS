//
//  AuthService.swift
//  AllIn
//
//  Created by Emre on 11/10/2023.
//

import Foundation

class AuthService: IAuthService {
    
    public func login(login: String, password: String, completion : @escaping (Int)-> ()) {
        
        let url = URL(string: Config.allInApi + "users/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let json = [
            "login": login.lowercased(),
            "password": password,
        ]
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []){
            URLSession.shared.uploadTask(with: request, from: jsonData) { data, response, error in
                print ("ALLIN : Process LOGIN")
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        if let data = data,
                           let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                           let token = json["token"] as? String {
                            AppStateContainer.shared.authenticationRefresh = token;
                        }
                    }
                    
                    completion(httpResponse.statusCode)
                }
            }.resume()
        }
    }
    
    func register(username: String, email: String, password: String, completion : @escaping (Int)-> ()) {
        let url = URL(string: Config.allInApi + "/users/register")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let json = [
            "email": email,
            "username": username.lowercased(),
            "password": password,
            "nbCoins": "0"
        ]
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []){
            URLSession.shared.uploadTask(with: request, from: jsonData) { data, response, error in
                print ("ALLIN : Process REGISTER")
                if let httpResponse = response as? HTTPURLResponse {
                    completion(httpResponse.statusCode)
                }
            }.resume()
        }
    }
    
    func refreshAuthentication(completion: @escaping (Int) -> ()) {
        
        guard let token = AppStateContainer.shared.authenticationRefresh else {
            completion(401)
            return
        }
        
        let url = URL(string: Config.allInApi + "users/token")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                completion(httpResponse.statusCode)
                if httpResponse.statusCode == 200 {
                    AppStateContainer.shared.loggedState.connectedUser = true
                }
            }
        }.resume()
    }
    
}
