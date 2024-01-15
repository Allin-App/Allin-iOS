//
//  ParticipateButton.swift
//  AllIn
//
//  Created by Lucas Delanier on 15/01/2024.
//

import SwiftUI

struct ParticipateButton: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Participer")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity).padding(10)
                .multilineTextAlignment(.center)
                .overlay {
                    AllInColors.primaryGradient.frame(width: 170)
                        .mask(
                            Text("Participer")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity).padding(10)
                        )
                }
        }
        .accentColor(AllInColors.componentBackgroundColor)
        .buttonStyle(.borderedProminent).cornerRadius(4.0)
        .overlay(
            RoundedRectangle(cornerRadius: 12).stroke(AllInColors.delimiterGrey, lineWidth: 1)
        )
        
    }
}

#Preview {
    ParticipateButton()
}
