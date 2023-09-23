//
//  SplashScreen.swift
//  AllIn
//
//  Created by étudiant on 23/09/2023.
//

import SwiftUI

struct Splash: View {
    
    @State private var size = 0.7
    @State private var opacity = 0.5
    @State private var rotationAngle: Angle = .degrees(0)
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Image("Icon")
                    .resizable()
                    .frame(width: 80, height: 80)
            }
            .scaleEffect(size)
            .opacity(opacity)
            .rotationEffect(rotationAngle)
            .onAppear {
                withAnimation(.easeIn(duration:1.1)){
                    self.size = 1
                    self.opacity = 1.00
                    self.rotationAngle = .degrees(1080)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(LinearGradient(gradient:
                                        Gradient(colors:[AllinColor.TopBarColorPink,AllinColor.TopBarColorPink,AllinColor.TopBarColorPurple,AllinColor.TopBarColorBlue,AllinColor.TopBarColorBlue]),
                                       startPoint: .bottomLeading, endPoint: .topTrailing))
        }
    }
    
}
