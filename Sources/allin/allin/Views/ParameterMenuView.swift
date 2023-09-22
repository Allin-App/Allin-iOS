//
//  ParameterMenuView.swift
//  AllIn
//
//  Created by étudiant on 21/09/2023.
//

import SwiftUI

struct ParameterMenuView: View {
    
    var icon: String
    var title: String
    var description: String
    
    var body: some View {
        HStack {
            Image(icon)
            VStack(alignment: .leading){
                Text(title)
                    .betTextStyle(weight: .bold, color: .white, size: 14)
                Text(description)
                    .betTextStyle(weight: .regular, color: AllinColor.DescriptionColorMenu, size: 9)
            }
            Spacer()
            Image("ChevronRightIcon")
                .resizable()
                .frame(width: 10, height: 18)
        }
        .padding([.leading,.trailing], 10)
        .padding([.top,.bottom], 15)
        .background(AllinColor.darkLight)
        .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(AllinColor.BorderColorMenu, lineWidth: 3)
        )
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))

    }
}
