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
    static let blueAccent = Color("BlueAccent")
    static let TopBarColorPink = Color("TopBarColorPink")
    static let TopBarColorBlue = Color("TopBarColorBlue")
    static let TopBarColorPurple = Color("TopBarColorPurple")
    static let DescriptionColorMenu = Color("DescriptionColorMenu")
    static let BorderColorMenu = Color("BorderColorMenu")
    static let gradiantCard = LinearGradient(
        gradient: Gradient(colors: [AllinColor.pinkAccentText, AllinColor.blueAccent]),
        startPoint: .bottomLeading,
        endPoint: .topTrailing
    )
}
