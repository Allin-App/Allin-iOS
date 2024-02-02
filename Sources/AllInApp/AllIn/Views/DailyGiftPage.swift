//
//  DailyGiftPage.swift
//  AllIn
//
//  Created by étudiant on 02/02/2024.
//

import SwiftUI

struct DailyGiftPage: View {
    @Binding var show: Bool
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.black.opacity(0.5),
                Color.black.opacity(0.9)
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
        .edgesIgnoringSafeArea(.all)
        
        VStack{
            Text("Récompense quotidienne")
                .font(.title)
                .foregroundColor(.white)
                .padding()
            
            Button("Fermer") {
                show.toggle()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

struct DailyGiftPage_Previews: PreviewProvider {
    static var previews: some View {
        DailyGiftPage(show: .constant(false))
    }
}
