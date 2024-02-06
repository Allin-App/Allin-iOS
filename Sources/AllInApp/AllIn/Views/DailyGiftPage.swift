//
//  DailyGiftPage.swift
//  AllIn
//
//  Created by Emre on 02/02/2024.
//

import SwiftUI

struct DailyGiftPage: View {
    
    enum Step {
        case first
        case end
    }
    
    @State private var step: Step = .first
    @State private var scale: CGFloat = 1.0
    @State private var scale2: CGFloat = 0
    @State private var rotate: CGFloat = 1
    @Binding var show: Bool
    @Binding var gain: Int
    
    var body: some View {
        GeometryReader { geometry in
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.black.opacity(0.6),
                    Color.black.opacity(0.9)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Récompense quotidienne")
                    .textStyle(weight: .bold, color: .white, size: 25)
                
                Group {
                    switch step {
                    case .first:
                        Image("giftImage")
                            .transition(
                                .asymmetric(
                                    insertion: .scale(scale: 0.9).combined(with: .opacity),
                                    removal: .scale(scale: 1.7).combined(with: .opacity))
                            )
                            .scaleEffect(scale)
                            .rotationEffect(.degrees(Double(scale) * 10), anchor: .center)
                            .rotationEffect(.degrees(-10), anchor: .center)
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                                    scale = 1.1
                                }
                            }
                    case .end:
                        ZStack {
                            Image("giftEarnImage")
                                .rotationEffect(.degrees(Double(rotate) * 10), anchor: .center)
                                .rotationEffect(.degrees(-10), anchor: .center)
                                .onAppear {
                                    withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                                        rotate = 1.3
                                    }
                                }
                            HStack {
                                Text("+ 123")
                                    .textStyle(weight: .black, color: .white, size: 55)
                                Image("allcoinWhiteIcon")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                        }
                        .scaleEffect(scale2)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 0.8)) {
                                scale2 = 1.0
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                withAnimation {
                                    show = false
                                    step = .first
                                }
                            }
                        }
                        .onDisappear {
                            scale2 = 0
                        }
                    }
                }
                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.4)
                .onTapGesture {
                    withAnimation {
                        switch step {
                        case .first:
                            step = .end
                            withAnimation {
                                AppStateContainer.shared.user?.nbCoins += gain
                            }
                        case .end:
                            show = false
                            step = .first
                        }
                    }
                }
                
                Text("Votre récompense quotidienne est débloquée tous les jours à 00:00 UTC et vous permet d’obtenir entre 10 et 150 Allcoins.")
                    .textStyle(weight: .medium, color: .white, size: 13)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, geometry.size.width * 0.13)
                    .opacity(0.67)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}


struct DailyGiftPage_Previews: PreviewProvider {
    static var previews: some View {
        DailyGiftPage(show: .constant(false), gain: .constant(20))
    }
}
