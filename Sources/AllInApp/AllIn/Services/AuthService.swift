//
//  AuthService.swift
//  AllIn
//
//  Created by Emre on 11/10/2023.
//

import Foundation
import Model
import ViewModel
import DependencyInjection
import Api
import StubLib

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
                            self.initializeUser(withToken: token) { status in
                                if status != 200 {
                                    completion(status)
                                    AppStateContainer.shared.authenticationRefresh = nil;
                                } else {
                                    self.initManagerVM(token: token)
                                }
                            }
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
            "email": email.lowercased(),
            "username": username.lowercased(),
            "password": password,
            "nbCoins": "0"
        ]
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []){
            URLSession.shared.uploadTask(with: request, from: jsonData) { data, response, error in
                print ("ALLIN : Process REGISTER")
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 201 {
                        if let data = data,
                           let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                           let token = json["token"] as? String {
                            AppStateContainer.shared.authenticationRefresh = token;
                            self.initializeUser(withToken: token) { status in
                                if status != 200 {
                                    completion(status)
                                    AppStateContainer.shared.authenticationRefresh = nil;
                                } else {
                                    self.initManagerVM(token: token)
                                }
                            }
                        }
                    }
                    completion(httpResponse.statusCode)
                }
            }.resume()
        }
    }
    
    func refreshAuthentication() {
        
        guard let token = AppStateContainer.shared.authenticationRefresh else {
            return
        }
                
        let url = URL(string: Config.allInApi + "users/token")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    if let userJson = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let user = User.mapUser(from: userJson) {
                        AppStateContainer.shared.user = user
                        AppStateContainer.shared.loggedState.connectedUser = true
                        self.initManagerVM(token: token)
                    }
                } else {
                    AppStateContainer.shared.authenticationRefresh = nil
                }
            }
        }.resume()
    }
    
    private func initializeUser(withToken token: String, completion: @escaping (Int) -> ()) {
        let url = URL(string: Config.allInApi + "users/token")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    if let userJson = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let user = User.mapUser(from: userJson) {
                        completion(httpResponse.statusCode)
                        AppStateContainer.shared.user = user
                    }
                } else {
                    completion(httpResponse.statusCode)
                }
            } else {
                completion(500)
            }
        }.resume()
    }
    
    private func initManagerVM(token: String) {
        DependencyInjection.shared.addSingleton(ManagerVM.self, ManagerVM(withModel: Manager(withBetDataManager: BetApiManager(), withUserDataManager: UserApiManager(withUserToken: token))))
    }
    
}
