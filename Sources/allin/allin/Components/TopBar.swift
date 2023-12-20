//
//  TopBar.swift
//  AllIn
//
//  Created by Emre on 19/09/2023.
//

import SwiftUI

struct TopBar: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        ZStack{
            HStack{
                Button(action: {withAnimation{ self.showMenu.toggle() }}) {
                    Image("threeLinesIcon")
                        .resizable()
                        .frame(width: 26,height: 15)
                        .padding(.leading, 20)
                }
                Spacer()
                AllcoinsCounter()
            }
            .frame(alignment: .top)
            Image("allinIcon")
                .resizable()
                .frame(width: 40, height: 40, alignment: .bottom)
            
        }
        .padding([.bottom], 20)
        .padding([.top], 10)
        .background(LinearGradient(gradient:
                                    Gradient(colors:[AllInColors.pinkAccentColor,AllInColors.purpleAccentColor,AllInColors.blueAccentColor]),
                                   startPoint: .bottomLeading, endPoint: .topTrailing))
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar(showMenu: .constant(false))
    }
}
