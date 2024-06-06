//
//  UsersPreview.swift
//  AllIn
//
//  Created by Lucas on 24/09/2023.
//

import SwiftUI
import Model

struct UsersPreview: View {
    var users: [User]?
    var body: some View {
        if users != nil {
            HStack(spacing: -20){
                ForEach(users!.prefix(4)) { user in
                    Image("defaultUserImage")
                        .resizable()
                        .frame(width: 35, height: 35)
                }
            }
        }
    }
}

struct UsersPreview_Previews: PreviewProvider {
    static var previews: some View {
        UsersPreview()
    }
}
