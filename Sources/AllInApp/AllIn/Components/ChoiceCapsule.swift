//
//  ChoiceCapsule.swift
//  AllIn
//
//  Created by Lucas on 26/09/2023.
//

import SwiftUI

struct ChoiceCapsule: View {
    
    @State var pressed = false
    
    var body: some View {
        Group {
            if(pressed) {
                Text("bet_current")
                    .textStyle(weight: .semibold, color: .white, size: 15)
                    .padding([.leading,.trailing],13.8)
                    .padding([.top,.bottom], 7)
                    .background(AllInColors.lightPurpleColor)
                    .clipShape(Capsule())
            } else {
                Text("bet_current")
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
            pressed.toggle()
        }
        
    }
}

struct ChoiceCapsule_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceCapsule()
    }
}
