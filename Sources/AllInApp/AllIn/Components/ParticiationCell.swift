//
//  ParticiationCell.swift
//  AllIn
//
//  Created by Lucas Delanier on 21/01/2024.
//

import SwiftUI
import Model

struct ParticiationCell: View {
    @State var participation: Participation?
    var body: some View {
        HStack(alignment: .center, spacing: 0){
            Circle().frame(width: 30, height: 30).foregroundColor(AllInColors.grey700Color).padding(.trailing, 5)
            Text(participation?.user.username ?? "Unknown")
                .font(.system(size: 15))
                .foregroundStyle(AllInColors.grey100Color)
                .fontWeight(.semibold)
            Spacer()
            Text(participation?.stake.description ?? "NaN")
                .font(.system(size: 18))
                .foregroundStyle(AllInColors.lightPurpleColor)
                .fontWeight(.bold).padding(.trailing, 5)
            Image("PurpleAllCoin").resizable().frame(width: 11, height: 12)
        }
    }
}

