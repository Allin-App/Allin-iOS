//
//  CoinCounter.swift
//  AllIn
//
//  Created by Emre KARTAL on 20/09/2023.
//

import SwiftUI

struct CoinCounterView: View {

    var body: some View {
        HStack(alignment: .center) {
            Image("AllCoinsIcon")
                .resizable()
                .frame(width: 17, height: 17, alignment: .leading)
            Text("541")
                .fontWeight(.black)
                .foregroundColor(Color("DarkGray"))
        }
        .frame(width: 90, height: 40)
        .background(Color.white)
        .cornerRadius(999)
        
    }
    
}


