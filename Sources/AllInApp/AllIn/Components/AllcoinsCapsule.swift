//
//  AllcoinsCount.swift
//  AllIn
//
//  Created by Lucas on 28/09/2023.
//

import SwiftUI

struct AllcoinsCapsule: View {
    var gains: Int
    var body: some View {
        Text("Vous remportez")
            .foregroundColor(.white)
        HStack{
            Text(gains.description)
                .textStyle(weight: .bold, color: .white, size: 60)
            Image("allcoinWhiteIcon")
                .resizable()
                .frame(width: 40, height:40)
                .scaledToFit()
        }
        .padding([.leading,.trailing],30)
        .padding([.top,.bottom],10)
        .background(.white.opacity(0.09))
        .cornerRadius(999, corners: .allCorners)
        .clipShape(Capsule())
        .overlay(RoundedRectangle(cornerRadius: 999).stroke(.white, lineWidth: 1.5))
    }
}

struct AllcoinsCapsule_Previews: PreviewProvider {
    static var previews: some View {
        AllcoinsCapsule(gains: 100)
    }
}
