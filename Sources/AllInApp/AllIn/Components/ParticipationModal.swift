//
//  ParticipationModal.swift
//  AllIn
//
//  Created by Lucas Delanier on 16/01/2024.
//

import SwiftUI

struct ParticipationModal: View {
    @State private var selectedOption = 0
    @State private var mise: String = ""
    let options: [(Int, String, Float)] = [
        (0, "OUI", 1.2),
        (1, "NON", 3.3),
    ]
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                Rectangle().foregroundStyle(AllInColors.grey800Color).frame(maxWidth: 80, maxHeight: 5).cornerRadius(999)
                Spacer()

            }.padding(10)
            HStack{
                Text("Faites vos paris").font(.system(size: 18)).foregroundColor(AllInColors.blackTitleColor).fontWeight(.semibold)
                Spacer()
                AllcoinsCounter(backgroundColor: AllInColors.purpleAccentColor, foregroundColor: AllInColors.whiteColor)
            }
            .padding(.leading, 15)
            VStack(alignment: .leading){
                Text("Emre va réussir son TP de CI/CD mercredi?").font(.system(size: 13)).foregroundColor(AllInColors.grey100Color).fontWeight(.light)
                DropDownAnswerMenu(selectedOption: $selectedOption, options: options)
                TextField("",text: $mise, prompt: Text("Mise")
                    .foregroundColor(AllInColors.lightGrey300Color)
                    .font(.system(size: 14))
                    .fontWeight(.bold))
                .padding()
                .keyboardType(.numberPad)
                .background(
                    RoundedRectangle(cornerRadius: 9)
                        .fill(AllInColors.lightGrey200Color)
                        .frame(height: 40)
                )
                .frame(width: .infinity, height: 40)
                .foregroundColor(AllInColors.primaryTextColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(AllInColors.delimiterGrey, lineWidth: 1)
                )
                .padding(.bottom, 5)

            }
            .padding(15)
            Spacer()
            VStack{
                HStack{
                    Text("Gains possibles").font(.system(size: 13)).foregroundColor(AllInColors.blackTitleColor).fontWeight(.regular)
                    Spacer()
                    Text("231").font(.system(size: 13)).foregroundColor(AllInColors.blackTitleColor).fontWeight(.light)
                }.padding(.top, 10).padding(.bottom, 0)
                Button {
                    
                } label: {
                    Text("Miser").font(.system(size: 23)).foregroundColor(AllInColors.whiteColor).fontWeight(.bold)
                        .frame(maxWidth: .infinity).padding(.vertical, 3)
                }
                .buttonStyle(.borderedProminent).tint(AllInColors.purpleAccentColor)

            }.padding(.horizontal, 10).background(AllInColors.whiteColor).border(width: 1, edges: [.top], color: AllInColors.delimiterGrey)
        }.background(AllInColors.underComponentBackgroundColor)
    }
}
