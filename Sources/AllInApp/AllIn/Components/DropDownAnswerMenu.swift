//
//  DropDownMenu.swift
//  AllIn
//
//  Created by Emre on 19/10/2023.
//

import SwiftUI
import Model

struct DropDownAnswerMenu: View {
    
    @State var expand = false
    @Binding var selectedAnswer: AnswerDetail
    var answers: [AnswerDetail]
    
    var body: some View {
        VStack(spacing: 0, content: {
            Button(action: { withTransaction(Transaction(animation: nil)) { self.expand.toggle() } }) {
                HStack{
                    Text(selectedAnswer.response)
                        .textStyle(weight: .bold, color: AllInColors.blueAccentColor, size: 20)
                    Text("\(selectedAnswer.odds, specifier: "%.2f")")
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
                    ForEach(answers) { (answer: AnswerDetail) in
                        if answer != selectedAnswer {
                            Button(action: {
                                self.selectedAnswer = answer
                                self.expand.toggle()}
                            ) {
                                HStack{
                                    Text(answer.response)
                                        .textStyle(weight: .bold, color: AllInColors.blueAccentColor, size: 20)
                                    Text("\(answer.odds, specifier: "%.2f")")
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
        .background(AllInColors.componentBackgroundColor)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(AllInColors.veryLightPurpleColor, lineWidth: 0.4)
        )
    }
}
