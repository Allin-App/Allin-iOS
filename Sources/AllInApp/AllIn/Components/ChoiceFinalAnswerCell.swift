//
//  ChoiceFinalAnswerCell.swift
//  AllIn
//
//  Created by Lucas Delanier on 29/01/2024.
//

import Foundation
import SwiftUI

struct ChoiceFinalAnswerCell: View {
    
    @State var selected = false
    var value = "OUI"
    var rawColor = AllInColors.blueAccentColor
    
    var body: some View {
        HStack{
            Spacer()
            Text(value)
                .textStyle(weight: .bold, color:rawColor, size: 40).padding(.vertical, 10)
            Spacer()
        }.background(AllInColors.whiteColor).onTapGesture() {
            selected.toggle()
        }.cornerRadius(17)
    }
}
