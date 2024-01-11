//
//  UserApiManager.swift
//
//
//  Created by Emre on 31/12/2023.
//

import Foundation
import Model

let allInApi = "https://codefirst.iut.uca.fr/containers/AllDev-api"

public struct UserApiManager: UserDataManager {
    
    public let token: String
    
    public init(withUserToken token: String) {
        self.token = token
    }
    
    public func getBets(withIndex index: Int, withCount count: Int) -> [Bet] {
        fatalError("Not implemented yet")
    }
    
    public func addBet(bet: Bet) {
        
        print(token)
        let url = URL(string: allInApi + "bets/add")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let json: [String: Any] = [
            "theme": bet.theme,
            "sentenceBet": bet.phrase,
            "endRegistration": dateFormatter.string(from: bet.endRegisterDate),
            "endBet": dateFormatter.string(from: bet.endBetDate),
            "isPrivate": String(bet.isPublic),
            "response": [],
            "createdBy": token
        ]
                
        if let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []){
            URLSession.shared.uploadTask(with: request, from: jsonData) { data, response, error in
                print ("ALLIN : Add BET")
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 201 {
                        
                    }
                    print(httpResponse.statusCode)
                }
            }.resume()
        }
    }
    
    public func getFriends() -> [User] {
        fatalError("Not implemented yet")
    }
}
