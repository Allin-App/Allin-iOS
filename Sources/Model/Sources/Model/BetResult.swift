//
//  BetResult.swift
//  
//
//  Created by Emre on 06/06/2024.
//

import Foundation

public class BetResult: Codable {
    
    public private(set) var id: String
    
    public private(set) var result: String
    
    public init(id: String, result: String) {
        self.id = id
        self.result = result
    }

}
