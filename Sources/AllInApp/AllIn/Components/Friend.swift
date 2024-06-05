//
//  Friend.swift
//  AllIn
//
//  Created by Emre on 27/09/2023.
//

import SwiftUI
import Model

struct Friend: View {
    
    var user: User
    let isRequest: Bool
    @ObservedObject var viewModel: FriendsViewModel
    
    var StatusValues: (String, Color, Color) {
        switch user.friendStatus {
        case .friend:
            return isRequest ? (String(localized: "generic_decline"), AllInColors.grey400Color, AllInColors.componentBackgroundColor) : (String(localized: "generic_delete"), AllInColors.grey400Color, AllInColors.componentBackgroundColor)
        case .notFriend:
            return isRequest ? (String(localized: "generic_acccept"), .white, AllInColors.lightPurpleColor) : (String(localized: "generic_add"), .white, AllInColors.lightPurpleColor)
        case .requested:
            return (String(localized: "friends_request_sent"), AllInColors.grey400Color, AllInColors.componentBackgroundColor)
        default:
            return ("NaN", AllInColors.grey400Color, AllInColors.componentBackgroundColor)
        }
    }
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: user.image ?? ""))
                .frame(width: 50, height: 50)
                .cornerRadius(180)
                .scaledToFit()
            Text(user.username)
                .fontWeight(.medium)
                .padding(.leading, 5)
                .font(.system(size: 18))
                .lineLimit(1)
            Spacer()
            Button(StatusValues.0) {
                viewModel.toggleFriendStatus(for: user, isRequest: isRequest)
            }
            .minimumScaleFactor(0.3)
            .lineLimit(2)
            .frame(width: 90, height: 30)
            .foregroundColor(StatusValues.1)
            .font(.system(size: 14))
            .background(StatusValues.2)
            .cornerRadius(5)
            if(isRequest){
                Button{
                    viewModel.declineRequest(username: user.username)
                }label: {
                    Image(systemName: "xmark").foregroundColor(.gray)
                }.padding([.leading], 25)
            }
        }
        .padding([.trailing,.leading], 25)
    }
}
