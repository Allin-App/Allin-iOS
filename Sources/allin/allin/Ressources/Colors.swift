//
//  Colors.swift
//  AllIn
//
//  Created by étudiant on 21/09/2023.
//

import Foundation
import SwiftUI

struct AllinColor {
    static let darkGray = Color("DarkGray")
    static let darkerGray = Color("DarkerGray")
    static let pinkAccentText = Color("PinkAccentText")
    static let darkLight = Color("DarkLight")
    static let backgroundWhite = Color("BackgroundWhite")
    static let PurpleText = Color("PurpleText")
    static let StartBackground = Color("StartBackground")
    static let blueAccent = Color("BlueAccent")
    static let TopBarColorPink = Color("TopBarColorPink")
    static let StartTextColor = Color("StartTextColor")
    static let LightPurple = Color("LightPurple")
    static let TopBarColorBlue = Color("TopBarColorBlue")
    static let TopBarColorPurple = Color("TopBarColorPurple")
    static let StrokeGrayColor = Color("StrokeGrayColor")
    static let DescriptionColorMenu = Color("DescriptionColorMenu")
    static let lightGray = Color("LightGray")
    static let BorderColorMenu = Color("BorderColorMenu")
    static let PrimaryTextColor = Color("PrimaryTextColor")
    static let DelimiterGray = Color("DelimiterGray")
    static let CapsuleGray = Color("CapsuleGray")
    static let LightGray_200 = Color("LightGray_200")
    static let TrendingBetCardBackground = Color("TrendingBetCardBackground")
    static let BetCardBackground = Color("BetCardBackground")


    static let gradiantCard = LinearGradient(
        gradient: Gradient(colors: [AllinColor.pinkAccentText, AllinColor.blueAccent]),
        startPoint: .bottomLeading,
        endPoint: .topTrailing
    )
    static let fadeInGradiantCard = LinearGradient(
        gradient: Gradient(colors: [AllinColor.backgroundWhite.opacity(0), AllinColor.backgroundWhite.opacity(0.9),AllinColor.backgroundWhite]),
        startPoint: .bottom,
        endPoint: .top
    )
}
