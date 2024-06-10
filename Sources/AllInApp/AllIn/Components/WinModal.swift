//
//  WinModal.swift
//  AllIn
//
//  Created by Lucas on 27/09/2023.
//

import SwiftUI
import Model

struct WinModal: View {
    @Environment(\.dismiss) var dismiss
    var betResult: BetResultDetail
    
    @State var xOffset: CGFloat = 0
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                let size = geometry.size.width / 20
                
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
                        Text(AppStateContainer.shared.user?.username ?? "").padding(.top,9).font(.system(size: 33)).fontWeight(.heavy).foregroundColor(.white)
                    }
                    .rotationEffect(.degrees(-4))
                    .padding(.top,40)
                    
                    Spacer()
                    AllcoinsCapsule(gains: betResult.amount)
                    Spacer()
                    RecapBetCard(betResult: betResult)
                    Spacer()
                }
                .padding([.all],20)
            }
            
        }.background(
            Image("modalBackgroundImage")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
    }
}

struct InfiniteScroller<Content: View>: View {
    var contentWidth: CGFloat
    var content: (() -> Content)
    
    @State
    var xOffset: CGFloat = -800
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                content()
                content()
                content()
            }
            .offset(x: xOffset, y: 0).opacity(0.3)
        }
        .disabled(true)
        .onAppear {
            withAnimation(
                .linear(duration: 25)
                .repeatForever(autoreverses: false)
            ) {
                xOffset = +contentWidth
            }
        }
        .frame(width: 1300, height: 1300)
        .padding(.leading, -400)
        .rotationEffect(.degrees(30))
        .opacity(0.1)
    }
}
