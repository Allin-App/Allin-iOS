//
//  DropDownAnswerMenu.swift
//  AllIn
//
//  Created by Lucas Delanier on 16/01/2024.
//

import SwiftUI

//
//  DropDownMenu.swift
//  AllIn
//
//  Created by Emre on 19/10/2023.
//

import SwiftUI

struct DropDownAnswerMenu: View {
    
    @State var expand = false
    @Binding var selectedOption: Int
    var options: [(Int, String, Float)]
    
    var body: some View {
        VStack(spacing: 0, content: {
            Button(action: { self.expand.toggle() }) {
                HStack{
                    Text(options[selectedOption].1.description)
                        .textStyle(weight: .bold, color: AllInColors.blueAccentColor, size: 20)
                    Text(options[selectedOption].2.description)
                        .textStyle(weight: .bold, color: AllInColors.lightPurpleColor, size: 10)
                    
                    Spacer()
                    Image(expand ? "chevronUpIcon" : "chevronDownIcon").resizable().frame(width: 15, height: 10).scaledToFill()
                }
                .padding([.leading, .trailing], 15)
                .frame(height: 43)
            }
            if expand {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(AllInColors.delimiterGrey)
                    .padding(.bottom, 18)
                VStack(spacing: 0) {
                    ForEach(0..<options.count, id: \.self) { index in
                        if options[index].0 != selectedOption {
                            Button(action: {self.selectedOption = options[index].0
                                self.expand.toggle()}) {
                                    HStack{
                                        Text(options[index].1.description)
                                            .textStyle(weight: .bold, color: AllInColors.blueAccentColor, size: 20)
                                        Text(options[index].2.description)
                                            .textStyle(weight: .bold, color: AllInColors.lightPurpleColor, size: 10)
                                        Spacer()
                                    }
                                }
                                .padding(.bottom, 15)
                        }
                    }
                }
                .padding([.leading, .trailing], 15)
            }
        })
        .frame(width: .infinity)
        .background(AllInColors.componentBackgroundColor)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(AllInColors.veryLightPurpleColor, lineWidth: 0.4)
        )
    }
}

struct DropDownAnswerMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropDownAnswerMenu(selectedOption: .constant(0), options: [
            (0, "questionMarkIcon", 1.2),
            (1, "footballIcon", 2.2),
            (2, "paintbrushIcon", 3.3)
        ])
        .preferredColorScheme(.dark)
    }
}

