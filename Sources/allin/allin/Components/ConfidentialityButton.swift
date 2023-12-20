//
//  ConfidentialityButton.swift
//  AllIn
//
//  Created by Emre on 29/09/2023.
//

import SwiftUI

struct ConfidentialityButton: View {
    
    var image: String
    var text: String
    var selected: Bool

    var body: some View {
        HStack() {
            Image(selected ? image + "Icon" : image + "PurpleIcon")
                .resizable()
                .scaledToFit()
                .padding(.vertical, 12)

            Text(text)
                .font(.system(size: 17))
                .fontWeight(.bold)
                .foregroundColor(selected ? .white : AllInColors.lightPurpleColor)
        }
        .frame(width: 110, height: 45)
        .background(selected ? AllInColors.lightPurpleColor : AllInColors.componentBackgroundColor)
        .cornerRadius(10)
    }
}

struct ConfidentialityButton_Previews: PreviewProvider {
    static var previews: some View {
        ConfidentialityButton(image: "lock", text: "Privé", selected: true)
    }
}
