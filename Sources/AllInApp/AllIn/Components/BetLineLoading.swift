//
//  BetLineLoading.swift
//  AllIn
//
//  Created by Lucas Delanier on 19/01/2024.
//

import SwiftUI
import Model

struct BetLineLoading: View {
    
    @State var participations: [Participation]
    
    var value: CGFloat {
        let totalParticipations = participations.count
        let numberOfYes = participations.filter { $0.response == "OUI" }.count
        let numberOfNo = participations.filter { $0.response == "NON" }.count
        if(numberOfNo == 0 && numberOfYes == 0){
            return 0.5
        }

            return totalParticipations > 0 ? CGFloat(numberOfYes) / CGFloat(totalParticipations) : 0.0
        }
    

    
    var yesParticipations: [Participation] {
            return participations.filter { $0.response == "OUI" }
        }
        
        var noParticipations: [Participation] {
            return participations.filter { $0.response == "NON" }
        }
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading,spacing: 0){
                HStack(spacing: 5){
                    Text("OUI").font(.system(size: 25)).fontWeight(.bold).foregroundColor(AllInColors.bleue200)
                    Spacer()
                    Text("NON").font(.system(size: 25)).fontWeight(.bold).foregroundColor(AllInColors.pink100)

                }
                ZStack(alignment: .leading) {
                    HStack{
                        Spacer()
                        Rectangle().frame(width: min(CGFloat(1-self.value)*geometry.size.width, geometry.size.width), height: 17)
                            .foregroundStyle(AllInColors.PinkBetGradiant).cornerRadius(999)
                    }
                    
                    HStack(spacing: 0){
                        Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: 17)
                            .foregroundStyle(AllInColors.BlueBetGradiant).cornerRadius(999)
                            .animation(.linear)
                        Image("LoadingHeart").resizable().frame(width: 29, height: 32).padding(.leading, -10)
                    }
                    
                }
                VStack(spacing: 1){
                    HStack(spacing: 5){
                        Image("BlueAllCoinIcon").resizable().frame(width:12, height: 12)
                        Text(yesParticipations.reduce(0, {x,y in x + y.stake}).description).font(.system(size: 15)).fontWeight(.bold).foregroundColor(AllInColors.bleue200)
                        Spacer()
                        Text(noParticipations.reduce(0, {x,y in x + y.stake}).description).font(.system(size: 15)).fontWeight(.bold).foregroundColor(AllInColors.pink100)
                        Image("PinkBadge").resizable().frame(width:10, height: 14)

                    }
                    HStack(spacing: 5){
                        Image("BleuePersonIcon").resizable().frame(width:14, height: 12)
                        Text(yesParticipations.count.description).font(.system(size: 15)).fontWeight(.bold).foregroundColor(AllInColors.bleue200)
                        Spacer()
                        Text(noParticipations.count.description).font(.system(size: 15)).fontWeight(.bold).foregroundColor(AllInColors.pink100)
                        Image("PinkBadge").resizable().frame(width:10, height: 14)

                    }
                    HStack(spacing: 5){
                        Image("BleueBadge").resizable().frame(width:10, height: 14)
                        Text(yesParticipations.max(by: { $0.stake < $1.stake })?.stake.description ?? "0").font(.system(size: 15)).fontWeight(.bold).foregroundColor(AllInColors.bleue200)
                        Spacer()
                        Text(noParticipations.max(by: { $0.stake < $1.stake })?.stake.description ?? "0").font(.system(size: 15)).fontWeight(.bold).foregroundColor(AllInColors.pink100)
                        Image("PinkBadge").resizable().frame(width:10, height: 14)

                    }
                    HStack(spacing: 5){
                        Image("BleueTrophyIcon").resizable().frame(width:14, height: 13)
                        Text("1.2").font(.system(size: 15)).fontWeight(.bold).foregroundColor(AllInColors.bleue200)
                        Spacer()
                        Text("1.2").font(.system(size: 15)).fontWeight(.bold).foregroundColor(AllInColors.pink100)
                        Image("PinkBadge").resizable().frame(width:10, height: 14)

                    }
                }
            }
                    
        }.frame(height: 140)
    }
}


