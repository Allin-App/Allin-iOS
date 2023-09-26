//
//  TextCapsule.swift
//  AllIn
//
//  Created by étudiant on 24/09/2023.
//

import SwiftUI

struct TextCapsule: View {
    var body: some View {
        Text("12 sept.").font(.system(size: 15)).foregroundColor(AllinColor.PrimaryTextColor).fontWeight(.bold).padding([.leading,.trailing],10).padding([.top,.bottom], 5).background(AllinColor.CapsuleGray).clipShape(Capsule()).overlay( /// apply a rounded border
            RoundedRectangle(cornerRadius: 20)
                .stroke(AllinColor.DelimiterGray, lineWidth: 1)
        )
    }
}

struct TextCapsule_Previews: PreviewProvider {
    static var previews: some View {
        TextCapsule()
    }
}
