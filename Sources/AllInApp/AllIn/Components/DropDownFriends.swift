//
//  DropDownFriends.swift
//  AllIn
//
//  Created by Emre on 16/12/2023.
//

import SwiftUI
import Model

struct DropDownFriends: View {
    
    @Binding var selectedItems: Set<String>
    @State var expand = false
    var friends: [User]
    
    var body: some View {
        VStack(spacing: 0, content: {
            Button(action: { self.expand.toggle() }) {
                HStack(spacing: 3){
                    Text(friends.count.description)
                        .textStyle(weight: .bold, color: AllInColors.primaryTextColor, size: 15)
                    Text("bet_creation_friends_available_format")
                        .textStyle(weight: .regular, color: AllInColors.grey800Color, size: 15)
                    
                    Spacer()
                    Image(expand ? "chevronUpIcon" : "chevronDownIcon").resizable().frame(width: 15, height: 7).scaledToFill()
                }
                .padding([.leading, .trailing], 15)
                .padding(.top, 5)
                .frame(height: 43)
            }
            if expand {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(AllInColors.delimiterGrey)
                ScrollView(.vertical) {
                    VStack(spacing: 0) {
                        ForEach(friends, id: \.self) {  (friend: User) in
                            HStack {
                                Circle()
                                    .fill(selectedItems.contains(friend.id) ? AllInColors.lightPurpleColor : Color.clear)
                                    .overlay(
                                        Circle()
                                            .stroke(selectedItems.contains(friend.id) ? Color.clear : AllInColors.skyBlueColor, lineWidth: 1)
                                    )
                                    .frame(width: 15, height: 15)
                                    .padding(.trailing, 5)
                                UserInfo(username: friend.username, value: friend.nbCoins)
                                    .contentShape(Rectangle())
                            }
                            .padding([.leading, .trailing], 15)
                            .padding([.top, .bottom], 5)
                            .overlay(
                                selectedItems.contains(friend.id) ?
                                        Rectangle()
                                            .fill(AllInColors.lightPurpleColor.opacity(0.13))
                                        : nil
                            )
                            .opacity(1.0)
                            .onTapGesture {
                                if selectedItems.contains(friend.id) {
                                    selectedItems.remove(friend.id)
                                } else {
                                    selectedItems.insert(friend.id)
                                }
                            }
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(AllInColors.delimiterGrey)
                            
                        }
                    }
                }
                .frame(height: 180)
            }
        })
        .frame(width: 345)
        .background(AllInColors.componentBackgroundColor)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(AllInColors.veryLightPurpleColor, lineWidth: 0.4)
        )
    }
}
