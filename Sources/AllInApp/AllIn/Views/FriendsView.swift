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
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            TopBar(showMenu: self.$showMenu)
            TabView(selection: $selectedTab) {
                ScrollView(showsIndicators: false){
                    VStack{
                        HStack {
                            TextField("Search...", text: $viewModel.text)
                                .padding(7)
                                .zIndex(200)
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
                        if(viewModel.users.isEmpty){
                            EmptyInfo(emoji:"👥", title:  String(localized: "empty_friends_title"), explain: String(localized: "empty_friends_explain")).padding(.top, 40)
                        }
                        else{
                            ForEach(viewModel.users, id: \.self) { friend in
                                Friend(user: friend, isRequest: false, viewModel: viewModel)
                            }
                        }
                        
                    }
                    Spacer()
                        
                }
                .refreshable {
                    viewModel.getItems()
                }
                .padding(.top, 50)
                .tag(0)
                VStack(alignment: .center, spacing: 0) {
                    if(viewModel.requests.isEmpty){
                        EmptyInfo(emoji:"📬", title: "Aucune demande d'amis en attente", explain: "").padding(.top, 40)
                    }
                    else{
                        ScrollView(showsIndicators: false){
                            ForEach(viewModel.requests, id: \.self) { request in
                                Friend(user: request, isRequest: true, viewModel: viewModel)
                            }
                        }
                        .refreshable {
                            viewModel.getRequests()
                        }
                        .padding(.top, 25)
                    }
                    Spacer()
                }
                .padding(.top, 50)
                .tag(1)
            }
            .overlay(
                HStack {
                    Button(action: {
                        selectedTab = 0
                    }) {
                        Text("friends_title")
                            .font(.system(size: 16))
                            .padding()
                            .fontWeight(selectedTab == 0 ? .bold : .semibold)
                            .foregroundColor(selectedTab == 0 ? AllInColors.primaryTextColor : .gray)
                            .offset(y: 0)
                    }
                    Button(action: {
                        selectedTab = 1
                    }) {
                        Text(String(localized: "friends_request") + (viewModel.requests.isEmpty ? "" : "(\(viewModel.requests.count.description))"))
                            .font(.system(size: 16))
                            .padding()
                            .fontWeight(selectedTab == 1 ? .bold : .semibold)
                            .foregroundColor(selectedTab == 1 ? AllInColors.primaryTextColor : .gray)
                            .offset(y: 0)
                    }
                }
                , alignment: .top)
            .tabViewStyle(PageTabViewStyle())
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(AllInColors.backgroundColor)
    }
}
