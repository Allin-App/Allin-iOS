//
//  UserInfo.swift
//  AllIn
//
//  Created by Emre on 16/12/2023.
//

import SwiftUI
import Model

struct UserInfo: View {
    var username: String
    var value: Int
    var body: some View {
        HStack {
            UserPicture(username: username, size: 35)
                .padding(.trailing, 7)
            Text(username)
                .font(.system(size: 15))
                .foregroundStyle(AllInColors.primaryTextColor)
                .fontWeight(.semibold)
            Spacer()
            Text(value.description)
                .font(.system(size: 18))
                .foregroundStyle(AllInColors.lightPurpleColor)
                .fontWeight(.bold)
                .padding(.trailing, 8)
            Image("PurpleAllCoin")
                .resizable()
                .frame(width: 11, height: 12)
        }
    }
}
