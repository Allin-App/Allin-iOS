//
//  BetApiManager.swift
//  
//
//  Created by Emre on 12/01/2024.
//

import Foundation
import Model

public struct BetApiManager: BetDataManager {
        
    public let token: String
    public let url: String
    
    public init(withUserToken token: String, andApiUrl url: String) {
        self.token = token
        self.url = url
    }
    
    public func getBets(withIndex index: Int, withCount count: Int, filters: [BetFilter] = [], completion: @escaping ([Bet]) -> Void) {
        let url = URL(string: url + "bets/gets")!

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        let filterStrings = filters.map { $0.rawValue }
        let jsonDictionary: [String: Any] = ["filters": filterStrings]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonDictionary, options: [])
            request.httpBody = jsonData
        } catch {
            print("Error creating JSON data: \(error)")
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                print ("ALLIN : get bets")
                do {
                    if let httpResponse = response as? HTTPURLResponse, let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                        var bets: [Bet] = []
                        for json in jsonArray {
                            if let bet = FactoryApiBet().toBet(from: json) {
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

    
    public func getUsers(username: String) -> [User] {
        return []
    }
    
    public func getBet(withId id: String, completion: @escaping (BetDetail) -> Void) {
        let url = URL(string: url + "betdetail/get/" + id)!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                print ("ALLIN : get bet with id :" + id)
                do {
                    if let httpResponse = response as? HTTPURLResponse, let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print(httpResponse.statusCode)
                        if let betDetail = FactoryApiBet().toBetDetail(from: json) {
                            completion(betDetail)
                        }
                    }
                } catch {
                    print("Error parsing JSON: \(error)")
                }
            }
        }.resume()
    }
    
    public func getPopularBet(completion: @escaping (Bet) -> Void) {
        let url = URL(string: url + "bets/popular")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                print ("ALLIN : get popular bet")
                do {
                    if let httpResponse = response as? HTTPURLResponse, let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        
                        if let bet = FactoryApiBet().toBet(from: json) {
                            completion(bet)
                        }
                        print(httpResponse.statusCode)
                    }
                } catch {
                    print("Error parsing JSON: \(error)")
                }
            }
        }.resume()
    }
}
