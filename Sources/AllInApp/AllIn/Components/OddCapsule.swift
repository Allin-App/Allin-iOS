//
//  OddCapsule.swift
//  AllIn
//
//  Created by Lucas Delanier on 03/02/2024.
//

import Foundation
import SwiftUI

struct OddCapsule: View {
    var backgroundColor: Color = AllInColors.purpleAccentColor
    var foregroundColor: Color = AllInColors.whiteColor
    var odd: Float = 0.0
    var body: some View {
        HStack(alignment: .center) {
            Text("x\(odd, specifier: "%.2f")")
                .fontWeight(.bold)
                .foregroundColor(foregroundColor)
        }
        .padding(.horizontal, 10)
        .padding(.vertical,5)
        .background(backgroundColor)
        .cornerRadius(9999)
        
    }
}

struct OddCapsule_Previews: PreviewProvider {
    static var previews: some View {
        OddCapsule()
    }
}
