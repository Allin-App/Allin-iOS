//
//  BetFilter.swift
//  
//
//  Created by Lucas Delanier on 27/05/2024.
//

import Foundation

public enum BetFilter: String, Codable {
    case inProgress = "IN_PROGRESS"
    case isPublic = "PUBLIC"
    case isInvitation = "INVITATION"
    case isFinished = "FINISHED"
}

