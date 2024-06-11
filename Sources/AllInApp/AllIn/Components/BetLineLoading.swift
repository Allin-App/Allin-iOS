//
//  BetLineLoading.swift
//  AllIn
//
//  Created by Lucas Delanier on 19/01/2024.
//

import SwiftUI
import Model

struct BetLineLoading: View {
    
    @State var showInfos: Bool = false
    var bet: BetDetail
    
    var value: CGFloat {
        let totalParticipations = bet.participations.count
        let numberOfYes = bet.participations.filter { $0.answer.uppercased() == "YES" }.count
        let numberOfNo = bet.participations.filter { $0.answer.uppercased() == "NO" }.count
        if(numberOfNo == 0 && numberOfYes == 0){
            return 0.5
        }
        
        return totalParticipations > 0 ? CGFloat(numberOfYes) / CGFloat(totalParticipations) : 0.0
    }
    
    var yesParticipations: [Participation] {
        bet.participations.filter { $0.answer.uppercased() == "YES" }
    }
    
    var noParticipations: [Participation] {
        bet.participations.filter { $0.answer.uppercased() == "NO" }
    }
    
    var body: some View {
        switch bet.bet {
            case is BinaryBet:
                BinaryBetLine(bet: bet)
            case is CustomBet:
                CustomBetLine(bet: bet)
            default:
                BinaryBetLine(bet: bet)
            }
    }
}


