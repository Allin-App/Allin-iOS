//
//  ParticipationModal.swift
//  AllIn
//
//  Created by Lucas Delanier on 16/01/2024.
//

import SwiftUI

struct ParticipationModal: View {
    
    @Binding private var selectedOption: Int
    @Binding private var mise: String
    private var description: String
    var participationAddedCallback: (() -> Void)?
    var possibleGain: Int {
        if let stake = Float(mise), let selectedOption = options.first(where: { $0.0 == self.selectedOption }) {
            return Int(round(stake * selectedOption.2))
        } else {
            return 0
        }
    }
    
    init(answer: Binding<Int>, mise: Binding<String>, description: String, participationAddedCallback: (() -> Void)? = nil) {
        self._selectedOption = answer
        self._mise = mise
        self.description = description
        self.participationAddedCallback = participationAddedCallback
    }
    
    let options: [(Int, String, Float)] = [
        (0, "OUI", 1.2),
        (1, "NON", 3.3),
    ]
    
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
                    Text(description)
                        .font(.system(size: 13))
                        .foregroundColor(AllInColors.primaryTextColor)
                        .fontWeight(.light)
                    
                    DropDownAnswerMenu(selectedOption: $selectedOption, options: options)
                    
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
                        participationAddedCallback?()
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
    
    func checkAndSetError() -> Bool {
        if let stake = Int(mise) {
            if stake <= AppStateContainer.shared.user?.nbCoins ?? 0 && stake > 0 {
                return false
            } else {
                return true
            }
        } else {
            return true
        }
    }
}
