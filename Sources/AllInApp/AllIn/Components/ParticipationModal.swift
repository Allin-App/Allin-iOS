//
//  ParticipationModal.swift
//  AllIn
//
//  Created by Lucas Delanier on 16/01/2024.
//

import SwiftUI
import Model

struct ParticipationModal: View {
    
    @Binding var selectedAnswer: AnswerDetail
    @Binding var mise: String
    var phrase: String
    var answers: [AnswerDetail]
    var participationAddedCallback: () -> Void
    var checkAndSetError: () -> Bool
    
    var possibleGain: Int {
        if let stake = Float(mise) {
            return Int(round(stake * selectedAnswer.odds))
        } else {
            return 0
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    Rectangle()
                        .foregroundStyle(AllInColors.lightGrey300Color)
                        .frame(maxWidth: 80, maxHeight: 5)
                        .cornerRadius(999)
                    Spacer()
                    
                }
                .padding(10)
                HStack{
                    Text("bet_status_place_your_bets")
                        .font(.system(size: 18))
                        .foregroundColor(AllInColors.primaryTextColor)
                        .fontWeight(.semibold)
                    Spacer()
                    AllcoinsCounter(backgroundColor: AllInColors.lightPurpleColor, foregroundColor: .white)
                }
                .padding(.leading, 15)
                VStack(alignment: .leading){
                    Text(phrase)
                        .font(.system(size: 13))
                        .foregroundColor(AllInColors.primaryTextColor)
                        .fontWeight(.light)
                    
                    DropDownAnswerMenu(selectedAnswer: $selectedAnswer, answers: answers)
                    
                    TextField("", text: $mise, prompt: Text("generic_stake")
                        .foregroundColor(AllInColors.lightGrey300Color)
                        .font(.system(size: 16))
                        .fontWeight(.bold))
                    .padding()
                    .keyboardType(.numberPad)
                    .background(
                        RoundedRectangle(cornerRadius: 9)
                            .fill(AllInColors.lightGrey200Color)
                            .frame(height: 40)
                    )
                    .frame(height: 40)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .stroke(AllInColors.delimiterGrey, lineWidth: 1)
                    )
                    .padding(.bottom, 5)
                    
                }
                .padding(15)
                Spacer()
                VStack{
                    HStack{
                        Text("participation_possible_winnings")
                            .font(.system(size: 13))
                            .foregroundColor(AllInColors.primaryTextColor)
                            .fontWeight(.medium)
                        Spacer()
                        Text(possibleGain.description)
                            .font(.system(size: 13))
                            .foregroundColor(AllInColors.primaryTextColor)
                            .fontWeight(.bold)
                        Image("allcoinIcon")
                            .resizable()
                            .frame(width: 11, height: 12)
                        
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 0)
                    Button {
                        participationAddedCallback()
                    } label: {
                        Text("Miser")
                            .font(.system(size: 23))
                            .foregroundColor(AllInColors.whiteColor)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 3)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(AllInColors.lightPurpleColor)
                    .disabled(checkAndSetError())
                    .padding(.bottom, 5)
                }
                .padding(.horizontal, 10)
                .background(AllInColors.whiteColor)
                .border(width: 1, edges: [.top], color: AllInColors.delimiterGrey)
            }
            .background(AllInColors.underComponentBackgroundColor)
        }
    }
}
