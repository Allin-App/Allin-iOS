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
    
    public init(withUserToken token: String) {
        self.token = token
    }
    
    public func getBets(withIndex index: Int, withCount count: Int, completion: @escaping ([Bet]) -> Void) {
        let url = URL(string: allInApi + "bets/gets")!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        var bets: [Bet] = []

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                print ("ALLIN : get bets")
                do {
                    if let httpResponse = response as? HTTPURLResponse, let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
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
        let url = URL(string: allInApi + "betdetail/get/" + id)!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                print ("ALLIN : get bet with id :" + id)
                do {
                    if let httpResponse = response as? HTTPURLResponse, let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        
                        if let betDetail = FactoryApiBet().toBetDetail(from: json) {
                            completion(betDetail)
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
