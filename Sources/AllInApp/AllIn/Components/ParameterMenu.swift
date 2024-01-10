//
//  ParameterMenu.swift
//  AllIn
//
//  Created by Emre on 21/09/2023.
//

import SwiftUI

struct ParameterMenu: View {
    
    var image: String
    var title: String
    var description: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 28, height: 28)
            VStack(alignment: .leading){
                Text(title)
                    .textStyle(weight: .bold, color: .white, size: 14)
                Text(description)
                    .textStyle(weight: .regular, color: AllInColors.grey600Color, size: 9)
                    .lineLimit(1)
            }
            Spacer()
            Image("chevronRightIcon")
                .resizable()
                .frame(width: 10, height: 18)
        }
        .padding([.leading,.trailing], 10)
        .padding([.top,.bottom], 15)
        .background(AllInColors.grey50Color)
        .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(AllInColors.grey100Color, lineWidth: 3)
        )
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        
    }
}

struct ParameterMenu_Previews: PreviewProvider {
    static var previews: some View {
        ParameterMenu(image: "eyesImage", title: "HISTORIQUE DES BETS", description: "Consultez vos paris en cours et terminés.")
    }
}
