//
//  GradiantCard.swift
//  AllIn
//
//  Created by étudiant on 21/09/2023.
//

import SwiftUI

struct GradiantCard: View{
    var body: some View {
        Rectangle()
            .stroke(
                LinearGradient(
                    gradient: AllinColor.gradiantCard,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                lineWidth: 5
            )
    }
}

struct GradiantCard_Previews: PreviewProvider {
    static var previews: some View {
        GradiantCard()
    }
}
