//
//  FriendsScreen.swift
//  AllIn
//
//  Created by étudiant on 27/09/2023.
//

import SwiftUI

struct Friends: View {
    @Binding var showMenu: Bool
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            TopBarView(showMenu: self.$showMenu)
            Text("Amis")
                .betTextStyle(weight: .bold, color: AllinColor.titleColor, size: 25)
                .padding([.top,.bottom],15)
            
            ScrollView(showsIndicators: false){
                Friend(image: "https://picsum.photos/536/354", pseudo: "Lucas")
                Friend(image: "https://picsum.photos/536/354", pseudo: "Arthur")
                Friend(image: "https://picsum.photos/536/354", pseudo: "Lucase")
                Friend(image: "https://picsum.photos/536/354", pseudo: "Rayhan")
                
            }.padding(.top, 25)
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom).background(AllinColor.backgroundWhite)
    }
}
