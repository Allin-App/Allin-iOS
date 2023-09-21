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
    
    var body: some View {
        HStack {
            Image(icon)
            Text(title)
                .foregroundColor(.white)
                .font(.headline)
            Spacer()
        }
        .background(AllinColor.darkLight)
        .cornerRadius(12)
    }
}
