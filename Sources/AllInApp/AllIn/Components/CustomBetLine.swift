//
//  CustomBetLine.swift
//  AllIn
//
//  Created by Lucas Delanier on 10/06/2024.
//

import SwiftUI
import Model

struct CustomBetLine: View {
    
    @State var showInfos: [String: Bool] = [:]
    var bet: BetDetail
    
    var participationsForAnswer: [String: [Participation]] {
        Dictionary(grouping: bet.participations, by: { $0.answer.uppercased() })
    }
    
    var sortedAnswers: [AnswerDetail] {
        bet.answers.sorted { $0.totalParticipants > $1.totalParticipants }
    }
    
    func getTextStyle(for answer: AnswerDetail) -> Font.Weight {
        return answer == sortedAnswers.first ? .bold : .light
    }
    
    func getColor(for answer: AnswerDetail) -> Color {
        return answer == sortedAnswers.first ? AllInColors.pinkAccentColor : AllInColors.blueAccentColor
    }
    
    func getGradiant(for answer: AnswerDetail) -> LinearGradient {
        return answer == sortedAnswers.first ? AllInColors.PinkBetGradiant : AllInColors.BlueBetLineGradiant
    }
    
    func getFlameImage(for answer: AnswerDetail) -> String {
        return answer == sortedAnswers.first ? "PinkFlame" : "BlueFlame"
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(sortedAnswers, id: \.response) { answer in
                let participations = participationsForAnswer[answer.response.uppercased()] ?? []
                let totalParticipations = bet.participations.count
                let percentage = totalParticipations > 0 ? CGFloat(participations.count) / CGFloat(totalParticipations) : 0.0
                
                VStack {
                    HStack {
                        Text(answer.response)
                            .font(.system(size: 15))
                            .fontWeight(getTextStyle(for: answer))
                            .foregroundColor(getColor(for: answer))
                        Spacer()
                    }
                    
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            HStack(spacing: 0) {
                                Rectangle()
                                    .frame(width: min(percentage * geometry.size.width, geometry.size.width-20), height: 17)
                                    .foregroundStyle(getGradiant(for: answer))
                                    .cornerRadius(999, corners: [.topLeft, .bottomLeft])
                                Image(getFlameImage(for: answer))
                                    .resizable()
                                    .frame(width: 29, height: 32)
                                    .padding(.leading, -6)
                                Text("\(Int(percentage * 100))%")
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                    .foregroundStyle(getColor(for: answer))
                                    .padding(.leading, 2)
                            }
                        }
                        .padding(.bottom, 5)
                    }
                    .frame(height: 40)
                    
                    HStack {
                        Spacer()
                        Text("bet_status_details_drawer")
                            .textStyle(weight: .medium, color: AllInColors.primaryTextColor, size: 10)
                        Image(showInfos[answer.response] ?? false ? "chevronUpIcon" : "chevronDownIcon")
                            .resizable()
                            .frame(width: 10, height: 7)
                            .scaledToFill()
                    }
                    .onTapGesture {
                        withAnimation {
                            showInfos[answer.response, default: false].toggle()
                        }
                    }
                    .padding(.trailing, 5)
                    
                    if showInfos[answer.response] ?? false {
                        HStack{
                            VStack(alignment: .leading,spacing: 1) {
                                HStack(spacing: 5) {
                                    Image(answer == sortedAnswers.first ? "pinkAllCoinIcon" : "blueAllCoinIcon")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                    Text(participations.reduce(0, { x, y in x + y.stake }).description)
                                        .font(.system(size: 15))
                                        .fontWeight(.bold)
                                        .foregroundColor(getColor(for: answer))
                                }
                                HStack(spacing: 5) {
                                    Image(answer == sortedAnswers.first ? "pinkPersonIcon" : "bluePersonIcon")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                    Text(participations.count.description)
                                        .font(.system(size: 15))
                                        .fontWeight(.bold)
                                        .foregroundColor(getColor(for: answer))
                                }
                                HStack(spacing: 5) {
                                    Image(answer == sortedAnswers.first ? "pinkBadgeIcon" : "blueBadgeIcon")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                    Text(participations.max(by: { $0.stake < $1.stake })?.stake.description ?? "0")
                                        .font(.system(size: 15))
                                        .fontWeight(.bold)
                                        .foregroundColor(getColor(for: answer))
                                }
                                HStack(spacing: 5) {
                                    Image(answer == sortedAnswers.first ? "pinkTrophyIcon" : "blueTrophyIcon")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                    Text(String(format: "%.2f", answer.odds))
                                        .font(.system(size: 15))
                                        .fontWeight(.bold)
                                        .foregroundColor(getColor(for: answer))
                                }
                            }
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}
