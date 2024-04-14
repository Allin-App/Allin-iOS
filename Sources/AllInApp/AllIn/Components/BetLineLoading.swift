//
//  BetLineLoading.swift
//  AllIn
//
//  Created by Lucas Delanier on 19/01/2024.
//

import SwiftUI
import Model

struct BetLineLoading: View {
    
    @State var showInfos: Bool = false
    var participations: [Participation]
    
    var value: CGFloat {
        let totalParticipations = participations.count
        let numberOfYes = participations.filter { $0.answer.uppercased() == "YES" }.count
        let numberOfNo = participations.filter { $0.answer.uppercased() == "NO" }.count
        if(numberOfNo == 0 && numberOfYes == 0){
            return 0.5
        }
        
        return totalParticipations > 0 ? CGFloat(numberOfYes) / CGFloat(totalParticipations) : 0.0
    }
    
    var yesParticipations: [Participation] {
        participations.filter { $0.answer.uppercased() == "YES" }
    }
    
    var noParticipations: [Participation] {
        participations.filter { $0.answer.uppercased() == "NO" }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 5) {
                Text("OUI")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(AllInColors.blue200)
                Spacer()
                Text("NON")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(AllInColors.pink100)
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    HStack{
                        Spacer()
                        Rectangle()
                            .frame(width: min(CGFloat(1-self.value) * geometry.size.width, geometry.size.width), height: 17)
                            .foregroundStyle(AllInColors.PinkBetGradiant).cornerRadius(999)
                    }
                    
                    HStack(spacing: 0) {
                        Rectangle()
                            .frame(width: min(CGFloat(self.value) * geometry.size.width, geometry.size.width), height: 17)
                            .foregroundStyle(AllInColors.BlueBetGradiant)
                            .cornerRadius(999)
                        Image("loadingHeartIcon")
                            .resizable()
                            .frame(width: 29, height: 32)
                            .padding(.leading, -10)
                    }
                    
                }
                .padding(.bottom, 5)
            }
            .frame(height: 40)

            HStack {
                Spacer()
                Text("Détails")
                    .textStyle(weight: .medium, color: AllInColors.primaryTextColor, size: 10)
                Image(showInfos ? "chevronUpIcon" : "chevronDownIcon")
                    .resizable()
                    .frame(width: 10, height: 7)
                    .scaledToFill()
            }
            .onTapGesture {
                withAnimation {
                    showInfos.toggle()
                }
            }
            .padding(.bottom, 5)
            .padding(.trailing, 5)
            
            if showInfos {
                VStack(spacing: 1) {
                    HStack(spacing: 5) {
                        Image("blueAllCoinIcon")
                            .resizable()
                            .frame(width:12, height: 12)
                        Text(yesParticipations.reduce(0, {x,y in x + y.stake}).description)
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(AllInColors.blue200)
                        Spacer()
                        Text(noParticipations.reduce(0, {x,y in x + y.stake}).description)
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(AllInColors.pink100)
                        Image("pinkAllCoinIcon")
                            .resizable()
                            .frame(width: 12, height: 12)
                    }
                    HStack(spacing: 5){
                        Image("bluePersonIcon")
                            .resizable()
                            .frame(width: 12, height: 12)
                        Text(yesParticipations.count.description)
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(AllInColors.blue200)
                        Spacer()
                        Text(noParticipations.count.description)
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(AllInColors.pink100)
                        Image("pinkPersonIcon")
                            .resizable()
                            .frame(width: 12, height: 12)
                        
                    }
                    HStack(spacing: 5){
                        Image("blueBadgeIcon")
                            .resizable()
                            .frame(width: 12, height: 12)
                        Text(yesParticipations.max(by: { $0.stake < $1.stake })?.stake.description ?? "0")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(AllInColors.blue200)
                        Spacer()
                        Text(noParticipations.max(by: { $0.stake < $1.stake })?.stake.description ?? "0")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(AllInColors.pink100)
                        Image("pinkBadgeIcon")
                            .resizable()
                            .frame(width: 12, height: 12)
                        
                    }
                    HStack(spacing: 5){
                        Image("blueTrophyIcon")
                            .resizable()
                            .frame(width: 12, height: 12)
                        Text("1.2")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(AllInColors.blue200)
                        Spacer()
                        Text("1.2")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(AllInColors.pink100)
                        Image("pinkTrophyIcon")
                            .resizable()
                            .frame(width:12, height: 12)
                    }
                }
            }
        }
    }
}


