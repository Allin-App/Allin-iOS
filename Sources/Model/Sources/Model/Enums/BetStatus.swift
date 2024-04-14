//
//  BetStatus.swift
//  
//
//  Created by Emre on 23/01/2024.
//

import Foundation

public enum BetStatus: String, Codable {
    case inProgress = "IN_PROGRESS"
    case waiting = "WAITING"
    case closing = "CLOSING"
    case finished = "FINISHED"
    case cancelled = "CANCELLED"
}

