//
//  AllcoinsCounter.swift
//  AllIn
//
//  Created by Emre on 20/09/2023.
//

import SwiftUI

struct AllcoinsCounter: View {
    
    var backgroundColor: Color = .white
    var foregroundColor: Color = AllInColors.primaryColor
    @ObservedObject var appStateContainer = AppStateContainer.shared
    
    var body: some View {
        HStack(alignment: .center) {
            Text(String(appStateContainer.user?.nbCoins ?? 0))
                .contentTransition(.numericText())
                .fontWeight(.black)
                .foregroundColor(foregroundColor)
            Image("allcoinIcon")
                .resizable()
                .frame(width: 17, height: 17, alignment: .leading)
        }
        .frame(width: 90, height: 40)
        .background(backgroundColor)
        .cornerRadius(9999, corners: [.topLeft, .bottomLeft])
        
    }
}

struct AllcoinsCounter_Previews: PreviewProvider {
    static var previews: some View {
        AllcoinsCounter()
    }
}
