//
//  CustomBetResponse.swift
//  
//
//  Created by Emre on 28/12/2023.
//

import Foundation

/// A class representing a user's response to a custom bet.
public class CustomBetResponse {
    /// The name or description of the custom bet response.
    public var name: String
    
    
    /// Custom Constructor
    /// 
    /// - Parameters:
    ///   - name: The name or description of the custom bet response.
    public init(name: String) {
        self.name = name
    }
}
