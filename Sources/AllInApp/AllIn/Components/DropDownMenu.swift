//
//  DropDownMenu.swift
//  AllIn
//
//  Created by Emre on 19/10/2023.
//

import SwiftUI

struct DropDownMenu: View {
    
    @State var expand = false
    @Binding var selectedOption: Int
    var options: [(Int, String, String)]
    
    var body: some View {
        VStack(spacing: 0, content: {
            Button(action: { self.expand.toggle() }) {
                HStack{
                    Image(options[selectedOption].1)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                    Text(options[selectedOption].2)
                        .textStyle(weight: .bold, color: AllInColors.lightPurpleColor, size: 15)
                    
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
                                        Image(options[index].1)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 15, height: 15)
                                        Text(options[index].2)
                                            .textStyle(weight: .bold, color: AllInColors.lightPurpleColor, size: 15)
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
        .frame(width: 345)
        .background(AllInColors.componentBackgroundColor)
        .cornerRadius(10)
    }
}

struct DropDownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropDownMenu(selectedOption: .constant(0), options: [
            (0, "questionMarkIcon", "Oui / Non"),
            (1, "footballIcon", "Pari sportif"),
            (2, "paintbrushIcon", "Réponses personnalisées")
        ])
        .preferredColorScheme(.dark)
    }
}
