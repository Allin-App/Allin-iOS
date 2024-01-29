//
//  BetEndingValidationView.swift
//  AllIn
//
//  Created by Lucas Delanier on 29/01/2024.
//

import Foundation
import SwiftUI
struct BetEndingValidation: View {
    @Environment(\.dismiss) var dismiss
    
    @State var xOffset: CGFloat = 0
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                
                InfiniteScroller(contentWidth: geometry.size.width) {
                    
                    Image("marquee").resizable().scaledToFit()
                }
                VStack {
                    ZStack(alignment: .topLeading){
                        HStack{
                            Spacer()
                            Image("allinIcon").resizable().frame(width: 35, height: 35)
                            Spacer()
                        }
                        
                        Image("crossIcon").resizable().frame(width: 25, height: 25).onTapGesture {
                            dismiss()
                        }
                        
                    }
                    HStack{
                        Text("FÉLICITATIONS").font(.system(size: 20)).foregroundColor(.white).fontWeight(.semibold).italic()
                        Text("PSEUDO!").padding(.top,9).font(.system(size: 33)).fontWeight(.heavy).foregroundColor(.white)
                    }
                    .rotationEffect(.degrees(-4))
                    .padding(.top,40)
                    
                    Spacer()
                    AllcoinsCapsule()
                    Spacer()
                    RecapBetCard()
                    Spacer()
                }
                .padding([.all],20)
            }
            
        }.background(AllInColors.greyDarkColor)
    }
}

