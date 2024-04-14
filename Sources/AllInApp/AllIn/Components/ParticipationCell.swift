//
//  ParticipationCell.swift
//  AllIn
//
//  Created by Lucas Delanier on 21/01/2024.
//

import SwiftUI
import Model

struct ParticipationCell: View {
    @State var participation: Participation
    var body: some View {
        HStack(alignment: .center, spacing: 0){
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(AllInColors.grey700Color)
                .padding(.trailing, 7)
            Text(participation.username)
                .font(.system(size: 15))
                .foregroundStyle(AllInColors.primaryTextColor)
                .fontWeight(.semibold)
            Spacer()
            Text(participation.stake.description)
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

