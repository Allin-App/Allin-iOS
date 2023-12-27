//
//  FriendsView.swift
//  AllIn
//
//  Created by Emre on 27/09/2023.
//

import SwiftUI

struct FriendsView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            TopBar(showMenu: self.$showMenu)
            Text("Amis")
                .textStyle(weight: .bold, color: AllInColors.grey500Color, size: 25)
                .padding([.top,.bottom],15)
            
            ScrollView(showsIndicators: false){
                Friend(image: "https://picsum.photos/536/354", pseudo: "Lucas")
                Friend(image: "https://picsum.photos/536/354", pseudo: "Arthur")
                Friend(image: "https://picsum.photos/536/354", pseudo: "Lucase")
                Friend(image: "https://picsum.photos/536/354", pseudo: "Rayhan")
                
            }
            .padding(.top, 25)
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(AllInColors.backgroundColor)
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView(showMenu: .constant(false))
    }
}
