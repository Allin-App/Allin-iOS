//
//  TopBarView.swift
//  AllIn
//
//  Created by Emre KARTAL on 19/09/2023.
//

import SwiftUI

struct GradientRectangle: View {
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .leading, endPoint: .trailing))
                .frame(width: geometry.size.width, height: geometry.size.height * 0.1)
                .clipped()
        }
    }
}
