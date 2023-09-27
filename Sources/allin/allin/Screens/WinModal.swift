//
//  WinModal.swift
//  AllIn
//
//  Created by étudiant on 27/09/2023.
//

import SwiftUI

struct WinModal: View {
    @State var xOffset: CGFloat = 0
    var body: some View {
        ZStack{
            Image("BackGradiant2").resizable()
            ZStack{
                GeometryReader { geometry in
                    let size = geometry.size.width / 20
                    
                    InfiniteScroller(contentWidth: size * 20) {
                        
                                    VStack(spacing: 20) {
                                        
                                        VStack(spacing: 20) {
                                            HStack(spacing: 20){
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110,height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                            }
                                            HStack(spacing: 20){
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110,height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                            }
                                            HStack(spacing: 20){
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110,height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                            }
                                            HStack(spacing: 20){
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110,height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                            }
                                            HStack(spacing:20){
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110,height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                            }
                                            HStack(spacing: 20){
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110,height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                            }
                                            HStack(spacing: 20){
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110,height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                            }
                                            HStack(spacing: 20){
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110,height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                            }
                                            HStack(spacing: 20){
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110,height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                            }
                                            HStack(spacing: 20){
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110,height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                            }
                                            

                                        }
                                        VStack(spacing: 20) {
                                            HStack(spacing: 20){
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110,height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                            }
                                            HStack(spacing: 20){
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110,height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                            }
                                            HStack(spacing: 20){
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110,height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                            }
                                            HStack(spacing: 20){
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110,height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                            }
                                            HStack(spacing:20){
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110,height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                            }
                                            HStack(spacing: 20){
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110,height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                            }
                                            HStack(spacing: 20){
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110,height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                            }
                                            HStack(spacing: 20){
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110,height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                            }
                                            HStack(spacing: 20){
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110,height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                            }
                                            HStack(spacing: 20){
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                                Image("Allcoins").resizable().frame(width: 110,height:110)
                                                Image("Allcoins").resizable().frame(width: 110, height:110)
                                            }
                                            

                                        }
                                        

                                    }.padding(10)
                                }
                    VStack {
                        ZStack(alignment: .topLeading){
                            HStack{
                                Spacer()
                                Image("Icon").resizable().frame(width: 35, height: 35)
                                Spacer()
                            }
                            
                            Image("Close_icon").resizable().frame(width: 25, height: 25)
                                
                        }
                        HStack{
                            Text("FÉLICITATIONS").font(.system(size: 20)).foregroundColor(.white).fontWeight(.semibold).italic()
                            Text("PSEUDO!").padding(.top,9).font(.system(size: 33)).fontWeight(.heavy).foregroundColor(.white)
                        }.rotationEffect(.degrees(-4)).padding(.top,40)
                        
                        
                    }.padding([.all],20)
                }
                
            }
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct WinModal_Previews: PreviewProvider {
    static var previews: some View {
        WinModal()
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
                    content()
                    content()
                    content()
                    content()
                    content()



                }
                .offset(x: xOffset, y: 0)
        }
        .disabled(true)
        .onAppear {
            withAnimation(.linear(duration: 25).repeatForever(autoreverses: false)) {
                xOffset = +contentWidth
            }
        }.frame(width: 1000).rotationEffect(.degrees(-30)).opacity(0.04)
    }
}


