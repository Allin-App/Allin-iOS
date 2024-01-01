//
//  MatchParticipation.swift
//  
//
//  Created by Emre on 28/12/2023.
//

import Foundation

public struct MatchParticipation: Participation {
    public var coinAmount: Int
    public var date: Date
    public var user: User
    public var bet: Bet
    public var PointsTeam1: Int
    public var PointsTeam2: Int

}
