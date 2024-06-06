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
    var picture: String?
    var value: Int
    var body: some View {
        HStack {
            UserPicture(picture: picture, username: username, size: 35)
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
                .padding(.trailing, 4)
            Image("PurpleAllCoin")
                .resizable()
                .frame(width: 15, height: 16)
        }
    }
}
