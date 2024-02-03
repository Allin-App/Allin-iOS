//
//  ChoiceFinalAnswerCell.swift
//  AllIn
//
//  Created by Lucas Delanier on 29/01/2024.
//

import Foundation
import SwiftUI
import Model

struct ChoiceFinalAnswerCell: View {
    
    var selected = false
    var answer: AnswerDetail
    var rawColor = AllInColors.blueAccentColor
    
    var body: some View {
        ZStack{
            HStack{
                Spacer()
                Text(answer.response)
                    .textStyle(weight: .bold, color: selected ? AllInColors.whiteColor :rawColor, size: 40).padding(.vertical, 10)
                Spacer()
            }
            HStack{
                Spacer()
                OddCapsule(backgroundColor: selected ? AllInColors.whiteColor : AllInColors.purpleAccentColor,  foregroundColor: selected ? AllInColors.purpleAccentColor : AllInColors.whiteColor ,odd: answer.odds ).padding(.trailing,20).scaleEffect(0.9)
            }
        }.background(selected ? AllInColors.purpleAccentColor : AllInColors.whiteColor).cornerRadius(17)
    }
}
