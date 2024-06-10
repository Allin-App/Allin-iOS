//
//  BetResult.swift
//  
//
//  Created by Emre on 06/06/2024.
//

import Foundation

public class BetResult: Codable {
    
    public private(set) var betId: String
    
    public private(set) var result: String
    
    public init(betId: String, result: String) {
        self.betId = betId
        self.result = result
    }

}
