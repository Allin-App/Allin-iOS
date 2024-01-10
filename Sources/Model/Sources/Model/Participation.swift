//
//  Participation.swift
//  
//
//  Created by Emre on 28/12/2023.
//

import Foundation

public protocol Participation {
    var coinAmount: Int { get set }
    var date: Date { get set }
    var user: User { get set }
    var bet: Bet { get set }
    
}
