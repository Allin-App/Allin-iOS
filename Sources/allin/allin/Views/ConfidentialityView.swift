//
//  ConfidentialityView.swift
//  AllIn
//
//  Created by étudiant on 04/10/2023.
//

import SwiftUI

struct ConfidentialityView: View {
    
    var image: String
    var text: String
    var selected: Bool

    var body: some View {
        HStack() {
            Image(systemName: image)
                .resizable()
                .frame(width: 18, height: 18)
                .foregroundColor(selected ? .white : AllinColor.PrimaryTextColor)

            Text(text)
                .font(.system(size: 17))
                .fontWeight(.bold)
                .foregroundColor(selected ? .white : AllinColor.PrimaryTextColor)
        }
        .frame(width: 110, height: 45)
        .background(selected ? AllinColor.PrimaryTextColor : .white)
        .cornerRadius(10)
    }
}
