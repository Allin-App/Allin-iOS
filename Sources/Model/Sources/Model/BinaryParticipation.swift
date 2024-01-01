//
//  BinaryParticipation.swift
//  
//
//  Created by Emre on 28/12/2023.
//

import Foundation

public enum YesNo {
    case yes
    case no
}

public struct BinaryParticipation: Participation {
    public var coinAmount: Int
    public var date: Date
    public var user: User
    public var bet: Bet
    public var answer: YesNo
    
}
