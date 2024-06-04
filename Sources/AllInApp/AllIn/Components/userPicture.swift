//
//  userPicture.swift
//  AllIn
//
//  Created by Lucas Delanier on 04/06/2024.
//

import SwiftUI

struct UserPicture: View {
    var picture: URL?
    var username: String
    var size: CGFloat
    var body: some View {
        ZStack {
            if picture != nil {
                AsyncImage(
                    url: picture,
                    content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
            } else {
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: size, height: size)
                    .overlay(
                        Text(username.prefix(2).uppercased())
                            .fontWeight(.medium)
                            .foregroundStyle(.white)
                            .font(.system(size: fontSize(for: size)))
                    )
            }
        }
    }
    
    func fontSize(for diameter: CGFloat) -> CGFloat {
        let fontScaleFactor: CGFloat = 0.45
        return diameter * fontScaleFactor
    }
}

struct UserPicture_Previews: PreviewProvider {
    static var previews: some View {
        UserPicture(picture: nil, username: "Lucas", size: 100)
    }
}
