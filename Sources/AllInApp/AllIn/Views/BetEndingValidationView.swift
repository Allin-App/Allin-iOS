//
//  BetEndingValidationView.swift
//  AllIn
//
//  Created by Lucas Delanier on 29/01/2024.
//

import Foundation
import SwiftUI
import Model
import StubLib

struct BetEndingValidation: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var xOffset: CGFloat = 0
    @State var selectedAnswer : String?
    var bet: BetDetail = BetStubManager().getABetDetail()
    
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                
                InfiniteScroller(contentWidth: geometry.size.width) {
                    Image("marquee")
                        .resizable()
                        .scaledToFit()
                }
                VStack {
                    ZStack(alignment: .topLeading){
                        HStack{
                            Spacer()
                            Image("allinIcon")
                                .resizable()
                                .frame(width: 35, height: 35)
                            Spacer()
                        }
                        
                        Image("crossIcon")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .onTapGesture {
                                dismiss()
                            }
                    }
                    ReviewCard(betDetail: bet, amountBetted: 0, isAWin: false)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    Text("Ce bet est arrivé à la date de fin. Vous devez à présent distribuer les gains en validant le pari gagnant.")
                        .textStyle(weight: .regular, color: AllInColors.grey800Color, size: 13)
                        .multilineTextAlignment(.center)
                    Text("Veuillez choisir la réponse finale:")
                        .font(.system(size: 17))
                        .foregroundStyle(AllInColors.whiteColor)
                        .fontWeight(.bold)
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack(spacing: 14){
                        ForEach(bet.answers, id: \.self) { answer in
                            ChoiceFinalAnswerCell(selected : answer.response == selectedAnswer, answer: answer).onTapGesture {
                                if(selectedAnswer == answer.response){
                                    selectedAnswer = nil
                                }
                                else {
                                    selectedAnswer = answer.response
                                }
                            }
                        }
                    }
                    Spacer()
                    selectedAnswer != nil ? Button {
                        dismiss()
                    } label: {
                        Text("Valider")
                            .font(.system(size: 23))
                            .foregroundColor(AllInColors.whiteColor)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 3)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(AllInColors.purpleAccentColor)
                    : nil
                }
                .padding([.all],20)
            }
            
        }.background(AllInColors.greyDarkColor)
    }
}



