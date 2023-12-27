//
//  TextCapsule.swift
//  AllIn
//
//  Created by Lucas on 24/09/2023.
//

import SwiftUI

struct TextCapsule: View {
    var body: some View {
        Text("12 sept.").font(.system(size: 15))
            .foregroundColor(AllInColors.lightPurpleColor)
            .fontWeight(.bold)
            .padding([.leading,.trailing],10)
            .padding([.top,.bottom], 5).background(AllInColors.underComponentBackgroundColor)
            .clipShape(Capsule())
            .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(AllInColors.delimiterGrey, lineWidth: 1)
        )
    }
}

struct TextCapsule_Previews: PreviewProvider {
    static var previews: some View {
        TextCapsule()
    }
}
