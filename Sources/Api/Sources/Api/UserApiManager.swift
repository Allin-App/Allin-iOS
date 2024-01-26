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
    
    public func getFriends() -> [User] {
        fatalError("Not implemented yet")
    }
    
    public func getOldBets(withIndex index: Int, withCount count: Int, completion: @escaping ([Bet]) -> Void) {
        fatalError("Not implemented yet")
    }
    
    public func addParticipation(withId id: String, withAnswer answer: String, andStake stake: Int) {
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
                }
            }.resume()
        }
    }
}
