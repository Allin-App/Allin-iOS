//
//  WelcomeView.swift
//  AllIn
//
//  Created by Emre on 23/09/2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                VStack(alignment: .leading, spacing: -5) {
                    Spacer()
                    Spacer()
                    Text("welcome_title")
                        .textStyle(weight: .bold, color: AllInColors.darkBlueColor, size: 30)
                        .frame(alignment: .topLeading)
                        .frame(width: geometry.size.width, alignment: .topLeading)
                    
                    Text("Allin")
                        .font(.system(size: 45).bold())
                        .foregroundStyle(LinearGradient(
                            colors: [AllInColors.pinkAccentColor, AllInColors.blueAccentColor],
                            startPoint: .bottomLeading,
                            endPoint: .topTrailing
                        ))
                        .padding(.bottom, 40)
                }
                .padding([.leading], geometry.size.width*0.2)
                .frame(width: geometry.size.width, height: 320)
                .background( LinearGradient(
                    stops: [
                        Gradient.Stop(color: AllInColors.startBackgroundColor.opacity(0), location: 0.00),
                        Gradient.Stop(color: AllInColors.startBackgroundColor.opacity(0.01), location: 0.07),
                        Gradient.Stop(color: AllInColors.startBackgroundColor.opacity(0.04), location: 0.13),
                        Gradient.Stop(color: AllInColors.startBackgroundColor.opacity(0.08), location: 0.20),
                        Gradient.Stop(color: AllInColors.startBackgroundColor.opacity(0.15), location: 0.27),
                        Gradient.Stop(color: AllInColors.startBackgroundColor.opacity(0.23), location: 0.33),
                        Gradient.Stop(color: AllInColors.startBackgroundColor.opacity(0.33), location: 0.40),
                        Gradient.Stop(color: AllInColors.startBackgroundColor.opacity(0.44), location: 0.47),
                        Gradient.Stop(color: AllInColors.startBackgroundColor.opacity(0.56), location: 0.53),
                        Gradient.Stop(color: AllInColors.startBackgroundColor.opacity(0.67), location: 0.60),
                        Gradient.Stop(color: AllInColors.startBackgroundColor.opacity(0.77), location: 0.67),
                        Gradient.Stop(color: AllInColors.startBackgroundColor.opacity(0.85), location: 0.73),
                        Gradient.Stop(color: AllInColors.startBackgroundColor.opacity(0.92), location: 0.80),
                        Gradient.Stop(color: AllInColors.startBackgroundColor.opacity(0.96), location: 0.87),
                        Gradient.Stop(color: AllInColors.startBackgroundColor.opacity(0.99), location: 0.93),
                        Gradient.Stop(color: AllInColors.startBackgroundColor, location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 0.85)
                ))
                VStack() {
                    Text("welcome_subtitle")
                        .textStyle(weight: .regular, color: AllInColors.darkBlueColor, size: 15)
                        .frame(width: geometry.size.width*0.8, alignment: .leading)
                        .padding([.leading,.trailing], 40)
                    
                    Spacer()
                    Spacer()
                    
                    NavigationLink(destination: RegisterView().navigationBarBackButtonHidden(true))
                    {
                        Text("welcome_join")
                            .textStyle(weight: .bold, color: AllInColors.whiteColor, size: 17)
                            .frame(width: min(geometry.size.width*0.85, 500), height: 50)
                            .background(AllInColors.loginPurpleColor)
                            .cornerRadius(30)
                    }
                    
                    HStack(spacing: 4) {
                        Text("generic_already_have_account")
                            .textStyle(weight: .regular, color: AllInColors.loginPurpleColor, size: 16)
                        
                        NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true))
                        {
                            Text("generic_login")
                                .textStyle(weight: .semibold, color: AllInColors.loginPurpleColor, size: 16)
                                .underline()
                        }
                    }
                    Spacer()
                }
                .frame(width: geometry.size.width, height: geometry.size.height/3.5)
                .background(AllInColors.startBackgroundColor)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(
                Image("welcomeBackgroundImage")
                    .resizable()
            )
            .edgesIgnoringSafeArea(.all)
            
        }
        .background(AllInColors.startBackgroundColor)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
