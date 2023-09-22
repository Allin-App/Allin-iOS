//
//  ContentView.swift
//  AllIn
//
//  Created by Emre KARTAL on 19/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            TopBarView()
            ScrollView{
                TrendingBetCard().padding(.top, 20)
            }.background(AllinColor.backgroundWhite)
            }
        .edgesIgnoringSafeArea([.bottom])
        .frame(alignment: .top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
