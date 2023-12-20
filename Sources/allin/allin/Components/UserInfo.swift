//
//  UserInfo.swift
//  AllIn
//
//  Created by Emre on 16/12/2023.
//

import SwiftUI

struct UserInfo: View {
    var body: some View {
        HStack {
            Image("defaultUserImage")
                .resizable()
                .frame(width: 35, height: 35)
            Text("David")
                .textStyle(weight: .bold, color: AllInColors.primaryTextColor, size: 13)
            Spacer()
            Image("allcoinIcon")
                .resizable()
                .frame(width: 17, height: 17, alignment: .leading)
            Text("541")
                .textStyle(weight: .black, color: AllInColors.lightPurpleColor, size: 16)
        }
    }
}

struct UserInfo_Previews: PreviewProvider {
    static var previews: some View {
        UserInfo()
    }
}
