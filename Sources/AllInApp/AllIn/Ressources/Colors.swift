//
//  Colors.swift
//  AllIn
//
//  Created by Lucas on 21/09/2023.
//

import Foundation
import SwiftUI

struct AllInColors {
    // Primary
    static let lightBlueAccentColor = Color("LightBlueAccentColor")
    static let blueAccentColor = Color("BlueAccentColor")
    static let purpleAccentColor = Color("PurpleAccentColor")
    static let pinkAccentColor = Color("PinkAccentColor")
    static let primaryColor = Color("PrimaryColor")
    static let primaryTextColor = Color("PrimaryTextColor")
    
    // Bet
    static let delimiterGrey = Color("DelimiterGrey")
    
    // Create Bet
    static let veryLightPurpleColor = Color("VeryLightPurpleColor")
    static let skyBlueColor = Color("SkyBlueColor")

    // Start, Register and Login
    static let startBackgroundColor = Color("StartBackgroundColor")
    static let loginPurpleColor = Color("LoginPurpleColor")
    static let whiteColor = Color("WhiteColor")
    
    // Others
    static let backgroundColor = Color("BackgroundColor")
    static let darkBlueColor = Color("DarkBlueColor")
    static let darkPurpleColor = Color("DarkPurpleColor")
    static let lightPurpleColor = Color("LightPurpleColor")
    static let blueGrey800Color = Color("BlueGrey800Color")
    static let grey50Color = Color("Grey50Color")
    static let grey100Color = Color("Grey100Color")
    static let grey400Color = Color("Grey400Color")
    static let grey500Color = Color("Grey500Color")
    static let grey600Color = Color("Grey600Color")
    static let grey700Color = Color("Grey700Color")
    static let grey800Color = Color("Grey800Color")
    static let lightGrey100Color = Color("LightGrey100Color")
    static let lightGrey200Color = Color("LightGrey200Color")
    static let lightGrey300Color = Color("LightGrey300Color")
    static let componentBackgroundColor = Color("ComponentBackgroundColor")
    static let underComponentBackgroundColor = Color("UnderComponentBackgroundColor")
    
    // Gradients
    static let primaryGradient = LinearGradient(
        gradient: Gradient(colors: [AllInColors.pinkAccentColor, AllInColors.blueAccentColor]),
        startPoint: .bottomLeading,
        endPoint: .topTrailing
    )
    static let fadeInGradiantCard = LinearGradient(
        gradient: Gradient(colors: [AllInColors.backgroundColor.opacity(0), AllInColors.backgroundColor.opacity(0.9), AllInColors.backgroundColor]),
        startPoint: .bottom,
        endPoint: .top
    )
    
}