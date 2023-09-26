//
//  WelcomePage.swift
//  AllIn
//
//  Created by étudiant on 23/09/2023.
//

import SwiftUI

struct Welcome: View {
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                VStack(alignment: .leading, spacing: 0) {
                    Spacer()
                    Spacer()
                    Text("Bienvenue sur,")
                        .frame(alignment: .topLeading)
                        .betTextStyle(weight: .bold, color: AllinColor.StartTextColor, size: 30)
                        .padding([.leading,.trailing], 40)
                    LinearGradient(
                        colors: [AllinColor.TopBarColorPink, AllinColor.TopBarColorBlue, AllinColor.TopBarColorBlue],
                        startPoint: .bottomLeading,
                        endPoint: .topTrailing
                    ).mask(
                        Text("Allin.")
                            .frame(width: geometry.size.width*0.80, alignment: .topLeading)
                            .font(Font.system(size: 45, weight: .bold))
                    )
                    .frame(width: geometry.size.width, height: 45, alignment: .topLeading)
                    .padding(.bottom, 40)
                }
                .frame(width: geometry.size.width, height: 320)
                .background( LinearGradient(
                    stops: [
                        Gradient.Stop(color: AllinColor.StartBackground.opacity(0), location: 0.00),
                        Gradient.Stop(color: AllinColor.StartBackground.opacity(0.01), location: 0.07),
                        Gradient.Stop(color: AllinColor.StartBackground.opacity(0.04), location: 0.13),
                        Gradient.Stop(color: AllinColor.StartBackground.opacity(0.08), location: 0.20),
                        Gradient.Stop(color: AllinColor.StartBackground.opacity(0.15), location: 0.27),
                        Gradient.Stop(color: AllinColor.StartBackground.opacity(0.23), location: 0.33),
                        Gradient.Stop(color: AllinColor.StartBackground.opacity(0.33), location: 0.40),
                        Gradient.Stop(color: AllinColor.StartBackground.opacity(0.44), location: 0.47),
                        Gradient.Stop(color: AllinColor.StartBackground.opacity(0.56), location: 0.53),
                        Gradient.Stop(color: AllinColor.StartBackground.opacity(0.67), location: 0.60),
                        Gradient.Stop(color: AllinColor.StartBackground.opacity(0.77), location: 0.67),
                        Gradient.Stop(color: AllinColor.StartBackground.opacity(0.85), location: 0.73),
                        Gradient.Stop(color: AllinColor.StartBackground.opacity(0.92), location: 0.80),
                        Gradient.Stop(color: AllinColor.StartBackground.opacity(0.96), location: 0.87),
                        Gradient.Stop(color: AllinColor.StartBackground.opacity(0.99), location: 0.93),
                        Gradient.Stop(color: AllinColor.StartBackground, location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 0.85)
                ))
                VStack() {
                    Text("Récupère tes Allcoins et vient parier avec tes amis pour prouver qui est le meilleur.")
                        .betTextStyle(weight: .regular, color: AllinColor.StartTextColor, size: 15)
                        .padding([.leading,.trailing], 40)
                    Spacer()
                    Spacer()
                    NavigationLink(destination: Register().navigationBarBackButtonHidden(true))
                    {
                        Text("Rejoindre")
                            .betTextStyle(weight: .bold, color: AllinColor.StartBackground, size: 17)
                            .frame(width: geometry.size.width*0.85, height: 50)
                            .background(AllinColor.LightPurple)
                            .cornerRadius(30)
                    }
                    
                    HStack(spacing: 0) {
                        Text("Tu as déja un compte? ")
                            .betTextStyle(weight: .regular, color: AllinColor.LightPurple, size: 16)
                        NavigationLink(destination: Login().navigationBarBackButtonHidden(true))
                        {
                            Text("Connexion")
                                .betTextStyle(weight: .semibold, color: AllinColor.LightPurple, size: 16)
                                .underline()
                        }
                    }
                    Spacer()
                }
                .frame(width: geometry.size.width, height: geometry.size.height/3.5)
                .background(AllinColor.StartBackground)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(
                Image("Background")
                    .resizable()
            )
            .edgesIgnoringSafeArea(.all)
            
        }
        .background(AllinColor.StartBackground)
    }
}
