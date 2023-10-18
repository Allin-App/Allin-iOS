//
//  AuthService.swift
//  AllIn
//
//  Created by étudiant on 11/10/2023.
//

import Foundation

class AuthService {
    
    let baseURL : String = "https://codefirst.iut.uca.fr/containers/AllDev-api/"
    
    public func login(email : String, password : String, completion : @escaping (Int)-> ()){
        let url = URL(string: baseURL+"users/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let json = [
            "username":email,
            "password":password,
        ]
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []){
            URLSession.shared.uploadTask(with: request, from: jsonData) { data, response, error in
                print ("ALLIN : Process LOGIN")
                if let httpResponse = response as? HTTPURLResponse {
                    completion(httpResponse.statusCode)
                }
            }.resume()
        }
    }
    
    
    public func register(email : String, password : String, username : String, completion : @escaping (Int)-> ()){
        let url = URL(string: baseURL+"/users/register")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let json = [
            "email":email,
            "username":username,
            "password":password,
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
    
}
