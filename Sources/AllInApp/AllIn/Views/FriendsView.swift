//
//  FriendsView.swift
//  AllIn
//
//  Created by Emre on 27/09/2023.
//

import SwiftUI

struct FriendsView: View {
    
    @StateObject private var viewModel = FriendsViewModel()
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            TopBar(showMenu: self.$showMenu)
            Text("friends_title")
                .textStyle(weight: .bold, color: AllInColors.grey500Color, size: 25)
                .padding([.top,.bottom],15)
            
            HStack {
                TextField("Search...", text: $viewModel.text)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                            
                            if !viewModel.text.isEmpty {
                                Button(action: {
                                    self.viewModel.text = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    )
                    .padding(.horizontal, 10)
            }
            
            ScrollView(showsIndicators: false){
                ForEach(viewModel.users, id: \.self) { friend in
                    Friend(user: friend, viewModel: viewModel)
                }
            }
            .padding(.top, 25)
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(AllInColors.backgroundColor)
    }
}
