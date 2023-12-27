//
//  UsersPreview.swift
//  AllIn
//
//  Created by Lucas on 24/09/2023.
//

import SwiftUI

struct UsersPreview: View {
    var body: some View {
        HStack(spacing: -20){
            Image("defaultUserImage")
                .resizable()
                .frame(width: 35, height: 35)
            Image("defaultUserImage")
                .resizable()
                .frame(width: 35, height: 35)
            Image("defaultUserImage")
                .resizable()
                .frame(width: 35, height: 35)
            Image("defaultUserImage")
                .resizable()
                .frame(width: 35, height: 35)
        }
    }
}

struct UsersPreview_Previews: PreviewProvider {
    static var previews: some View {
        UsersPreview()
    }
}
