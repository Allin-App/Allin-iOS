//
//  ParticipateButton.swift
//  AllIn
//
//  Created by Lucas Delanier on 15/01/2024.
//

import SwiftUI

struct ParticipateButton: View {
    @Binding var isOpen : Bool
    @State var isDisabled: Bool = false
    var body: some View {
        Button {
            isOpen.toggle()
        } label: {
            Text("Participer")
                .font(.system(size: 27))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity).padding(10)
                .multilineTextAlignment(.center)
                .overlay {
                    switch isDisabled{
                    case true:
                        AllInColors.grey700Color.frame(width: 170)
                            .mask(
                                Text("Participer")
                                    .font(.system(size: 27))
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity).padding(10)
                            )
                    case false:
                        AllInColors.primaryGradient.frame(width: 170)
                            .mask(
                                Text("Participer")
                                    .font(.system(size: 27))
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity).padding(10)
                            )
                        
                    }
                }
                .accentColor(AllInColors.componentBackgroundColor)
                .background(isDisabled ? AllInColors.delimiterGrey.opacity(0.5):AllInColors.whiteColor)
                .buttonStyle(.borderedProminent).cornerRadius(4.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 12).stroke(AllInColors.delimiterGrey, lineWidth: 1)
                )
                
            
        }
    }
}
