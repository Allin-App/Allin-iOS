//
//  CustomParticipation.swift
//  
//
//  Created by Emre on 28/12/2023.
//

import Foundation

public struct CustomParticipation: Participation {
    public var coinAmount: Int
    public var date: Date
    public var user: User
    public var bet: Bet
    public var answer: CustomBetResponse
    
}
