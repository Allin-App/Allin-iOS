//
//  AllcoinsCounter.swift
//  AllIn
//
//  Created by Emre on 20/09/2023.
//

import SwiftUI

struct AllcoinsCounter: View {
    var backgroundColor: Color = AllInColors.whiteColor
    var foreGroundColor: Color = AllInColors.primaryColor
    var body: some View {
        HStack(alignment: .center) {
            Image("allcoinIcon")
                .resizable()
                .frame(width: 17, height: 17, alignment: .leading)
            Text(String(AppStateContainer.shared.user?.nbCoins ?? 0))
                .fontWeight(.black)
                .foregroundColor(foreGroundColor)
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
