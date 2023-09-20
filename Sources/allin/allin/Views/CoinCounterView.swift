//
//  CoinCounter.swift
//  AllIn
//
//  Created by Emre KARTAL on 20/09/2023.
//

import SwiftUI

struct CoinCounterView: View {
    var body: some View {
        HStack() {
            Image("AllCoinsIcon")
                .resizable()
                .frame(width: 25, height: 25, alignment: .leading)
            Text("541")
        }
        .frame(width: 50, height: 120)
        .background(Color.white)
    }
    
}

