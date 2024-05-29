//
//  ChoiceCapsule.swift
//  AllIn
//
//  Created by Lucas on 26/09/2023.
//

import SwiftUI
import Model

struct ChoiceCapsule: View {
    let filter: BetFilter
    @State var pressed = false
    @ObservedObject var viewModel: BetViewModel
    
    var label: String {
        switch filter {
        case .isPublic:
            return String(localized: "bet_public")
        case .isInvitation:
            return String(localized: "bet_invitation")
        case .inProgress:
            return String(localized: "bet_current")
        case .isFinished:
            return String(localized: "bet_finished")
        default:
            return "NaN"
        }
    }
    
    var body: some View {
        Group {
            if(pressed) {
                Text(label)
                    .textStyle(weight: .semibold, color: .white, size: 15)
                    .padding([.leading,.trailing],13.8)
                    .padding([.top,.bottom], 7)
                    .background(AllInColors.lightPurpleColor)
                    .clipShape(Capsule())
            } else {
                Text(label)
                    .textStyle(weight: .regular, color: AllInColors.grey800Color, size: 15)
                    .padding([.leading,.trailing], 15)
                    .padding([.top,.bottom], 7)
                    .background(AllInColors.underComponentBackgroundColor)
                    .clipShape(Capsule())
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(AllInColors.delimiterGrey, lineWidth: 1)
                    )
            }
        }
        .onTapGesture() {
            if(!pressed) {
                viewModel.filters.insert(filter)
            } else {
                viewModel.filters.remove(filter)
            }
            pressed.toggle()
        }
        
    }
}
