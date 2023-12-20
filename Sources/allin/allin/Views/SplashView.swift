//
//  SplashView.swift
//  AllIn
//
//  Created by Emre on 23/09/2023.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [AllInColors.pinkAccentColor, AllInColors.purpleAccentColor, AllInColors.lightBlueAccentColor]),
                startPoint: .bottomLeading,
                endPoint: .topTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            Image("allinIcon")
                .resizable()
                .frame(width: 80, height: 80)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
