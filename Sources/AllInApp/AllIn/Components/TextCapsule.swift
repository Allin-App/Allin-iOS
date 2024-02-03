//
//  TextCapsule.swift
//  AllIn
//
//  Created by Lucas on 24/09/2023.
//

import SwiftUI

struct TextCapsule: View {
    var date: Date
    
    private var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM"
        return dateFormatter.string(from: date)
    }

    private var formattedTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }

    var body: some View {
        HStack {
            Text(formattedDate)
                .font(.system(size: 15))
                .foregroundColor(AllInColors.lightPurpleColor)
                .fontWeight(.bold)
                .padding([.leading, .trailing], 10)
                .padding([.top, .bottom], 5)
                .background(AllInColors.underComponentBackgroundColor)
                .clipShape(Capsule())
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(AllInColors.delimiterGrey, lineWidth: 1)
                )
                        
            Text(formattedTime)
                .font(.system(size: 15))
                .foregroundColor(AllInColors.lightPurpleColor)
                .fontWeight(.bold)
                .padding([.leading, .trailing], 10)
                .padding([.top, .bottom], 5)
                .background(AllInColors.underComponentBackgroundColor)
                .clipShape(Capsule())
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(AllInColors.delimiterGrey, lineWidth: 1)
                )
            
            Spacer()

        }
    }
}

struct TextCapsule_Previews: PreviewProvider {
    static var previews: some View {
        TextCapsule(date: Date())
    }
}
