//
//  EmptyInfo.swift
//  AllIn
//
//  Created by Lucas Delanier on 29/05/2024.
//

import SwiftUI

struct EmptyInfo: View {
    let emoji: String
    let title: String
    let explain: String
    var body: some View {
        VStack{
            Text(emoji).font(.system(size: 120))
            Text(title).textStyle(weight: .bold, color: AllInColors.primaryTextColor , size: 15)
            explain.isEmpty ? nil :  Text(explain).textStyle(weight: .light, color: .gray, size: 12)
        }.opacity(0.55).padding(.horizontal, 20).multilineTextAlignment(.center)
    }
}

struct EmptyInfo_Previews: PreviewProvider {
    static var previews: some View {
        EmptyInfo(emoji:"👥", title: "Vous n’avez pas encore d’amis", explain: "Ajoutez les depuis cet écran")
    }
}
