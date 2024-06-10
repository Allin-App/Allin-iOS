//
//  CustomBet.swift
//  
//
//  Created by Emre on 28/12/2023.
//

import Foundation

/// A subclass of Bet that represents a custom bet, allowing users to define their own parameters and rules.
public class CustomBet: Bet {
    
    /// List of custom responses
    private var customResponses: [String] = []
    
    /// Override the getResponses function to return custom responses
    ///
    /// - Returns: A list of custom responses
    public override func getResponses() -> [String] {
        return customResponses
    }
    
    /// Add a custom response
    ///
    /// - Parameter response: The custom response to add
    public func addCustomResponse(_ response: String) {
        customResponses.append(response)
    }
    
}
