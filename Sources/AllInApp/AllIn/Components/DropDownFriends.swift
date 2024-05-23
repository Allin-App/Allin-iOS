//
//  DropDownFriends.swift
//  AllIn
//
//  Created by Emre on 16/12/2023.
//

import SwiftUI

struct DropDownFriends: View {
    
    @State private var selectedItems: Set<Int> = []
    @State var expand = false
    let friends: [(Int, Int, String, String)] = [
        (0, 541, "David", "defaultUserImage"),
        (1, 541, "David", "defaultUserImage"),
        (2, 541, "David", "defaultUserImage"),
        (3, 541, "David", "defaultUserImage"),
        (4, 541, "David", "defaultUserImage"),
        (5, 541, "David", "defaultUserImage")
    ]
    
    var body: some View {
        VStack(spacing: 0, content: {
            Button(action: { self.expand.toggle() }) {
                HStack(spacing: 3){
                    Text("41")
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
                        ForEach(0..<friends.count, id: \.self) { item in
                            HStack {
                                Circle()
                                    .fill(selectedItems.contains(friends[item].0) ? AllInColors.lightPurpleColor : Color.clear)
                                    .overlay(
                                        Circle()
                                            .stroke(selectedItems.contains(friends[item].0) ? Color.clear : AllInColors.skyBlueColor, lineWidth: 1)
                                    )
                                    .frame(width: 15, height: 15)
                                    .padding(.trailing, 5)
                                UserInfo()
                                    .contentShape(Rectangle())
                            }
                            .padding([.leading, .trailing], 15)
                            .padding([.top, .bottom], 5)
                            .overlay(
                                selectedItems.contains(friends[item].0) ?
                                        Rectangle()
                                            .fill(AllInColors.lightPurpleColor.opacity(0.13))
                                        : nil
                            )
                            .opacity(1.0)
                            .onTapGesture {
                                if selectedItems.contains(friends[item].0) {
                                    selectedItems.remove(friends[item].0)
                                } else {
                                    selectedItems.insert(friends[item].0)
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

struct DropDownFriends_Previews: PreviewProvider {
    static var previews: some View {
        DropDownFriends()
    }
}
