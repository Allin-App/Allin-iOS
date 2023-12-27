//
//  AllcoinsCounter.swift
//  AllIn
//
//  Created by Emre on 20/09/2023.
//

import SwiftUI

struct AllcoinsCounter: View {
    var body: some View {
        HStack(alignment: .center) {
            Image("allcoinIcon")
                .resizable()
                .frame(width: 17, height: 17, alignment: .leading)
            Text("541")
                .fontWeight(.black)
                .foregroundColor(AllInColors.primaryColor)
        }
        .frame(width: 90, height: 40)
        .background(Color.white)
        .cornerRadius(9999, corners: [.topLeft, .bottomLeft])
        
    }
}

struct AllcoinsCounter_Previews: PreviewProvider {
    static var previews: some View {
        AllcoinsCounter()
    }
}
