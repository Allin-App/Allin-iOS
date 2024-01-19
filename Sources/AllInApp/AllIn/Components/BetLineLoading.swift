//
//  BetLineLoading.swift
//  AllIn
//
//  Created by Lucas Delanier on 19/01/2024.
//

import SwiftUI

struct BetLineLoading: View {
    
    @Binding var value: Float
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0){
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
                        Image("BleueBadge").resizable().frame(width:10, height: 14)
                        Text("1.2").font(.system(size: 15)).fontWeight(.bold).foregroundColor(AllInColors.bleue200)
                        Spacer()
                        Text("1.2").font(.system(size: 15)).fontWeight(.bold).foregroundColor(AllInColors.pink100)
                        Image("PinkBadge").resizable().frame(width:10, height: 14)

                    }
                    HStack(spacing: 5){
                        Image("BleueBadge").resizable().frame(width:10, height: 14)
                        Text("1.2").font(.system(size: 15)).fontWeight(.bold).foregroundColor(AllInColors.bleue200)
                        Spacer()
                        Text("1.2").font(.system(size: 15)).fontWeight(.bold).foregroundColor(AllInColors.pink100)
                        Image("PinkBadge").resizable().frame(width:10, height: 14)

                    }
                    HStack(spacing: 5){
                        Image("BleueBadge").resizable().frame(width:10, height: 14)
                        Text("1.2").font(.system(size: 15)).fontWeight(.bold).foregroundColor(AllInColors.bleue200)
                        Spacer()
                        Text("1.2").font(.system(size: 15)).fontWeight(.bold).foregroundColor(AllInColors.pink100)
                        Image("PinkBadge").resizable().frame(width:10, height: 14)

                    }
                    HStack(spacing: 5){
                        Image("BleueBadge").resizable().frame(width:10, height: 14)
                        Text("1.2").font(.system(size: 15)).fontWeight(.bold).foregroundColor(AllInColors.bleue200)
                        Spacer()
                        Text("1.2").font(.system(size: 15)).fontWeight(.bold).foregroundColor(AllInColors.pink100)
                        Image("PinkBadge").resizable().frame(width:10, height: 14)

                    }
                }
            }
                    
        }
    }
}


