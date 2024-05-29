//
//  UserApiManager.swift
//
//
//  Created by Emre on 31/12/2023.
//

import Foundation
import Model

let allInApi = "https://codefirst.iut.uca.fr/containers/AllDev-api/"

public struct UserApiManager: UserDataManager {
    
    public let token: String
    
    public init(withUserToken token: String) {
        self.token = token
    }
    
    public func getBets(withIndex index: Int, withCount count: Int) -> [Bet] {
        fatalError("Not implemented yet")
    }
    
    public func getBetsOver(completion : @escaping ([BetDetail])-> ()) {
        let url = URL(string: allInApi + "bets/toConfirm")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        var bets: [BetDetail] = []
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                print ("ALLIN : get bets over")
                do {
                    if let httpResponse = response as? HTTPURLResponse, let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                        for json in jsonArray {
                            if let bet = FactoryApiBet().toBetDetail(from: json) {
                                bets.append(bet)
                            }
                        }
                        print(httpResponse.statusCode)
                        completion(bets)
                    }
                } catch {
                    print("Error parsing JSON: \(error)")
                }
            }
        }.resume()
    }
    
    public func addBet(bet: Bet, completion : @escaping (Int)-> ()) {
        
        let url = URL(string: allInApi + "bets/add")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let json = FactoryApiBet().toResponse(bet: bet)
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []){
            URLSession.shared.uploadTask(with: request, from: jsonData) { data, response, error in
                print ("ALLIN : Add BET")
                if let httpResponse = response as? HTTPURLResponse {
                    print(httpResponse.statusCode)
                    completion(httpResponse.statusCode)
                }
            }.resume()
        }
    }
    
    public func addFriend(username: String, completion : @escaping (Int)-> ()) {
        
        let url = URL(string: allInApi + "friends/add")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let json: [String: Any] = ["username": username]
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []){
            URLSession.shared.uploadTask(with: request, from: jsonData) { data, response, error in
                print ("ALLIN : Add friend")
                if let httpResponse = response as? HTTPURLResponse {
                    print(httpResponse.statusCode)
                    completion(httpResponse.statusCode)
                }
            }.resume()
        }
    }
    
    public func removeFriend(username: String, completion : @escaping (Int)-> ()) {
        
        let url = URL(string: allInApi + "friends/delete")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let json: [String: Any] = ["username": username]
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []){
            URLSession.shared.uploadTask(with: request, from: jsonData) { data, response, error in
                print ("ALLIN : Remove friend")
                if let httpResponse = response as? HTTPURLResponse {
                    print(httpResponse.statusCode)
                    completion(httpResponse.statusCode)
                }
            }.resume()
        }
    }
    
    public func getFriends(completion: @escaping ([User]) -> Void) {
        let url = URL(string: allInApi + "friends/gets")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        var users: [User] = []
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                print ("ALLIN : get friends")
                do {
                    if let httpResponse = response as? HTTPURLResponse, let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                        print(jsonArray)
                        users = try JSONDecoder().decode([User].self, from: JSONSerialization.data(withJSONObject: jsonArray))
                        print(httpResponse.statusCode)
                        completion(users)
                    }
                } catch {
                    print("Error parsing JSON: \(error)")
                }
            }
        }.resume()
    }
    
    public func getUsers(withName name: String, completion: @escaping ([User]) -> Void) {
        let url = URL(string: allInApi + "friends/search/" + name)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        var users: [User] = []
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                print ("ALLIN : get friends by search")
                do {
                    if let httpResponse = response as? HTTPURLResponse, let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                        print(jsonArray)
                        users = try JSONDecoder().decode([User].self, from: JSONSerialization.data(withJSONObject: jsonArray))
                        print(httpResponse.statusCode)
                        completion(users)
                    }
                } catch {
                    print("Error parsing JSON: \(error)")
                }
            }
        }.resume()
    }
    
    public func getGifts(completion : @escaping (Int, Int)-> ()) {
        let url = URL(string: allInApi + "users/gift")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                print ("ALLIN : get gifts of the day")
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        if let stringValue = String(data: data, encoding: .utf8), let intValue = Int(stringValue) {
                            completion(httpResponse.statusCode, intValue)
                        }
                    } else {
                        completion(httpResponse.statusCode, 0)
                    }
                    print(httpResponse.statusCode)
                }
            }
        }.resume()
    }
    
    public func getOldBets(withIndex index: Int, withCount count: Int, completion: @escaping ([Bet]) -> Void) {
        fatalError("Not implemented yet")
    }
    
    public func getCurrentBets(withIndex index: Int, withCount count: Int, completion: @escaping ([BetDetail]) -> Void) {
        let url = URL(string: allInApi + "bets/current")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        var bets: [BetDetail] = []
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                print ("ALLIN : get current bets")
                do {
                    if let httpResponse = response as? HTTPURLResponse, let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                        for json in jsonArray {
                            print(json)
                            if let bet = FactoryApiBet().toBetDetail(from: json) {
                                bets.append(bet)
                            }
                        }
                        print(httpResponse.statusCode)
                        completion(bets)
                    }
                } catch {
                    print("Error parsing JSON: \(error)")
                }
            }
        }.resume()
    }
    
    public func addParticipation(withId id: String, withAnswer answer: String, andStake stake: Int, completion : @escaping (Int)-> ()) {
        let url = URL(string: allInApi + "participations/add")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let json: [String: Any] = [
            "betId": id,
            "answer": answer,
            "stake": stake
        ]
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []){
            URLSession.shared.uploadTask(with: request, from: jsonData) { data, response, error in
                print ("ALLIN : Add Participation")
                if let httpResponse = response as? HTTPURLResponse {
                    print(httpResponse.statusCode)
                    completion(httpResponse.statusCode)
                }
            }.resume()
        }
    }
    
    public func addResponse(withIdBet id: String, andResponse responseBet: String) {
        let url = URL(string: allInApi + "bets/confirm/" + id)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let json: [String: String] = [
            "result": responseBet,
        ]
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []){
            URLSession.shared.uploadTask(with: request, from: jsonData) { data, response, error in
                print ("ALLIN : add response " + responseBet + " for the bet Id " + id)
                if let httpResponse = response as? HTTPURLResponse {
                    print(httpResponse.statusCode)
                }
            }.resume()
        }
    }
}
