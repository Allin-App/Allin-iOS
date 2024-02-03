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
    
    @Binding var show: Bool
    
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
                            .transition(.opacity)
                    case .end:
                        ZStack {
                            Image("giftEarnImage")
                                .transition(.opacity)
                            HStack {
                                Text("+ 123")
                                    .textStyle(weight: .black, color: .white, size: 55)
                                Image("allcoinWhiteIcon")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                        }
                    }
                }
                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.4)
                .onTapGesture {
                    withAnimation {
                        switch step {
                        case .first:
                            step = .end
                        case .end:
                            step = .first
                            show.toggle()
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
        DailyGiftPage(show: .constant(false))
    }
}
