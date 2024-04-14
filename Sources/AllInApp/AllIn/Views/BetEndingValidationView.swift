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

struct BetEndingValidationView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject private var viewModel: BetEndingValidationViewModel
    var bet: BetDetail
    
    init(bet: BetDetail) {
        self.bet = bet
        self._viewModel = StateObject(wrappedValue: BetEndingValidationViewModel(id: bet.bet.id))
    }
    
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
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 14){
                        ForEach(bet.answers) { answer in
                            ChoiceFinalAnswerCell(selected : answer.response == viewModel.selectedAnswer, answer: answer).onTapGesture {
                                if(viewModel.selectedAnswer == answer.response){
                                    viewModel.selectedAnswer = nil
                                }
                                else {
                                    viewModel.selectedAnswer = answer.response
                                }
                            }
                        }
                    }
                    Spacer()
                    Button {
                        dismiss()
                        viewModel.post()
                    } label: {
                        Text("Valider")
                            .font(.system(size: 23))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 3)
                    }
                    .opacity(viewModel.selectedAnswer != nil ? 1 : 0)
                    .animation(.easeInOut(duration: 0.3), value: viewModel.selectedAnswer != nil)
                    .buttonStyle(.borderedProminent)
                    .tint(AllInColors.purpleAccentColor)
                }
                .padding([.all],20)
            }
            
        }.background(AllInColors.greyDarkColor)
    }
}



