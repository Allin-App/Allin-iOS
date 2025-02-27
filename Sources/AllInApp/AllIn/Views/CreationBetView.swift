//
//  CreateBetView.swift
//  AllIn
//
//  Created by Emre on 29/09/2023.
//

import SwiftUI

struct CreationBetView: View {
    
    @StateObject private var viewModel = CreationBetViewModel()
    @Binding var showMenu: Bool
    @State private var selectedTab = 0
    
    // Popovers
    @State private var showTitlePopover: Bool = false
    @State private var showDescriptionPopover: Bool = false
    @State private var showRegistrationEndDatePopover: Bool = false
    @State private var showBetEndDatePopover: Bool = false
    @State private var showConfidentialityPopover: Bool = false
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startDate = Date()
        let endDate = calendar.date(byAdding: .year, value: 10, to: startDate)!
        return startDate ... endDate
    }()
    let screenWidth = UIScreen.main.bounds.width
    
    private func updateGroupedItems() {
        
        var updatedGroupedItems: [[String]] = [[String]] ()
        var tempItems: [String] = [String] ()
        var width: CGFloat = 0
        var dynamicWidthLimit: CGFloat
        
        for value in viewModel.values {
            let label = UILabel()
            label.text = value
            label.sizeToFit()
            dynamicWidthLimit = CGFloat(tempItems.count) * 105.0
            
            let labelWidth = label.frame.size.width
            if (width + labelWidth + dynamicWidthLimit) < screenWidth {
                width += labelWidth
                tempItems.append(value)
            } else {
                width = labelWidth
                updatedGroupedItems.append(tempItems)
                tempItems.removeAll()
                tempItems.append(value)
            }
        }
        updatedGroupedItems.append(tempItems)
        
        viewModel.groupedItems = updatedGroupedItems
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            NavigationLink(destination: MainView(page: "Bet").navigationBarBackButtonHidden(true), isActive: $viewModel.betAdded) {
                EmptyView()
            }
            TopBar(showMenu: self.$showMenu)
            TabView(selection: $selectedTab) {
                
                // First Page
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 5) {
                        VStack() {
                            HStack(spacing: 5) {
                                Text("bet_creation_theme")
                                    .textStyle(weight: .bold, color: AllInColors.primaryTextColor, size: 17)
                                
                                Image("questionMarkGreyIcon")
                                    .resizable()
                                    .frame(width: 14, height: 14)
                                    .onTapGesture {
                                        showTitlePopover.toggle()
                                    }
                                    .allInPopover(isPresented: $showTitlePopover, paddingHorizontal: 20) {
                                        String(localized: "bet_creation_theme_tooltip")
                                    }
                                
                                Spacer()
                            }
                            .frame(width:  340)
                            .padding(.leading, 10)
                            
                            VStack {
                                if let themeError = $viewModel.themeFieldError.wrappedValue {
                                    Text(themeError)
                                        .textStyle(weight: .bold, color: .red, size: 10)
                                }
                                TextField("", text: $viewModel.theme, prompt: Text("bet_creation_theme_placeholder")
                                    .foregroundColor(AllInColors.lightGrey300Color)
                                    .font(.system(size: 14))
                                    .fontWeight(.light))
                                .autocorrectionDisabled(true)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 9)
                                        .fill(AllInColors.componentBackgroundColor)
                                        .frame(height: 40)
                                )
                                .frame(width: 350, height: 40)
                                .foregroundColor(AllInColors.primaryTextColor)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .stroke(AllInColors.delimiterGrey, lineWidth: 1)
                                )
                                .padding(.bottom, 5)
                            }
                        }
                        
                        HStack(spacing: 5) {
                            Text("bet_creation_bet_phrase")
                                .textStyle(weight: .bold, color: AllInColors.primaryTextColor, size: 17)
                            
                            Image("questionMarkGreyIcon")
                                .resizable()
                                .frame(width: 14, height: 14)
                                .allInPopover(isPresented: $showDescriptionPopover, paddingHorizontal: 10) {
                                    String(localized: "bet_creation_phrase_tooltip")
                                }
                            
                            Spacer()
                        }
                        .frame(width: 340)
                        .padding(.leading, 10)
                        
                        VStack {
                            
                            if let descriptionError = $viewModel.descriptionFieldError.wrappedValue {
                                Text(descriptionError)
                                    .textStyle(weight: .bold, color: .red, size: 10)
                            }
                            
                            TextField("", text: $viewModel.description, prompt: Text("bet_creation_bet_phrase_placeholder")
                                .foregroundColor(AllInColors.lightGrey300Color)
                                .font(.system(size: 14))
                                .fontWeight(.light), axis: .vertical)
                            .autocorrectionDisabled(true)
                            .lineLimit(4, reservesSpace: true)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 9)
                                    .fill(AllInColors.componentBackgroundColor)
                                    .frame(height: 110)
                            )
                            .frame(width: 350, height: 110)
                            .foregroundColor(AllInColors.primaryTextColor)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .stroke(AllInColors.delimiterGrey, lineWidth: 1)
                            )
                            .padding(.bottom, 30)
                        }
                        
                        HStack(spacing: 5) {
                            Text("bet_creation_end_registration_date")
                                .textStyle(weight: .bold, color: AllInColors.primaryTextColor, size: 17)
                            Image("questionMarkGreyIcon")
                                .resizable()
                                .frame(width: 14, height: 14)
                                .allInPopover(isPresented: $showRegistrationEndDatePopover) {
                                    String(localized: "bet_creation_register_tooltip")
                                }
                            
                            Spacer()
                        }
                        .frame(width:  340)
                        .padding(.leading, 10)
                        
                        VStack {
                            if let endRegisterError = $viewModel.endRegisterDateFieldError.wrappedValue {
                                Text(endRegisterError)
                                    .textStyle(weight: .bold, color: .red, size: 10)
                            }
                            HStack(spacing: 5) {
                                DatePicker(
                                    "",
                                    selection: $viewModel.endRegisterDate,
                                    in: Date()...,
                                    displayedComponents: [.date, .hourAndMinute]
                                )
                                .accentColor(AllInColors.lightPurpleColor)
                                .labelsHidden()
                                .padding(.bottom, 10)
                                Spacer()
                            }
                            .frame(width:  340)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            VStack() {
                                HStack(spacing: 5) {
                                    Text("bet_creation_end_bet_date")
                                        .textStyle(weight: .bold, color: AllInColors.primaryTextColor, size: 17)
                                    
                                    Image("questionMarkGreyIcon")
                                        .resizable()
                                        .frame(width: 14, height: 14)
                                        .allInPopover(isPresented: $showBetEndDatePopover) {
                                            String(localized: "bet_creation_bet_end_tooltip")
                                        }
                                    
                                    Spacer()
                                }
                                .padding(.leading, 10)
                            }
                            
                            VStack {
                                if let endBetError = $viewModel.endBetDateFieldError.wrappedValue {
                                    Text(endBetError)
                                        .textStyle(weight: .bold, color: .red, size: 10)
                                }
                                HStack(spacing: 5) {
                                    DatePicker(
                                        "",
                                        selection: $viewModel.endBetDate,
                                        in:  viewModel.endRegisterDate...,
                                        displayedComponents: [.date, .hourAndMinute]
                                    )
                                    .accentColor(AllInColors.lightPurpleColor)
                                    .labelsHidden()
                                    .padding(.bottom, 40)
                                    Spacer()
                                }
                            }
                        }
                        .frame(width: 340)
                        
                        VStack {
                            HStack(spacing: 5) {
                                Text("bet_creation_bet_privacy")
                                    .textStyle(weight: .bold, color: AllInColors.primaryTextColor, size: 17)
                                Image("questionMarkGreyIcon")
                                    .resizable()
                                    .frame(width: 14, height: 14)
                                    .allInPopover(isPresented: $showConfidentialityPopover, paddingHorizontal: 15) {
                                        String(localized: "bet_creation_privacy_tooltip")
                                    }
                                
                                Spacer()
                            }
                            .padding(.leading, 10)
                            
                            HStack(spacing: 5) {
                                ConfidentialityButton(image: "globe", text: String(localized: "bet_public"), selected: !viewModel.isPrivate)
                                    .onTapGesture {
                                        viewModel.isPrivate = false
                                    }
                                    .padding(.trailing, 5)
                                
                                ConfidentialityButton(image: "lock", text: String(localized: "bet_private"), selected: viewModel.isPrivate)
                                    .onTapGesture {
                                        viewModel.isPrivate = true
                                    }
                                Spacer()
                            }
                        }
                        .frame(width: 340)
                        .padding(.bottom, 10)
                        
                        
                        VStack(spacing: 10) {
                            
                            if self.viewModel.isPrivate {
                                DropDownFriends(selectedItems: $viewModel.invited, friends: viewModel.friends)
                                    .padding(.bottom, 30)
                                
                                HStack() {
                                    Spacer()
                                    Text("bet_creation_private_bottom_text_1")
                                        .textStyle(weight: .bold, color: AllInColors.veryLightPurpleColor, size: 13)
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                }
                                
                                HStack() {
                                    Spacer()
                                    Text("bet_creation_private_bottom_text_2")
                                        .textStyle(weight: .bold, color: AllInColors.veryLightPurpleColor, size: 13)
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                }
                            } else {
                                HStack() {
                                    Spacer()
                                    Text("bet_creation_public_bottom_text_1")
                                        .textStyle(weight: .bold, color: AllInColors.veryLightPurpleColor, size: 13)
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                }
                                
                                HStack() {
                                    Spacer()
                                    Text("bet_creation_public_bottom_text_2")
                                        .textStyle(weight: .bold, color: AllInColors.veryLightPurpleColor, size: 13)
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                }
                            }
                            
                            HStack() {
                                Spacer()
                                Text("bet_creation_bottom_text_3")
                                    .textStyle(weight: .bold, color: AllInColors.veryLightPurpleColor, size: 13)
                                    .padding(.leading, 35)
                                    .multilineTextAlignment(.center)
                                Spacer()
                            }
                        }
                        Spacer()
                        HStack() {
                            Spacer()
                            Button(action: {
                                viewModel.create()
                            }) {
                                Text("bet_creation_publish")
                                    .font(.system(size: 24))
                                    .fontWeight(.bold)
                                    .overlay {
                                        AllInColors.primaryGradient.frame(width: 200)
                                            .mask(
                                                Text("bet_creation_publish")
                                                    .font(.system(size: 24))
                                                    .fontWeight(.bold)
                                                    .frame(maxWidth: .infinity)
                                            )
                                    }
                            }
                            .frame(width: 335, height: 60)
                            .background(AllInColors.componentBackgroundColor)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .stroke(AllInColors.delimiterGrey, lineWidth: 1)
                            )
                            Spacer()
                        }
                    }
                    .padding([.leading, .trailing, .bottom], 30)
                    .padding(.top, 50)
                }
                .tag(0)
                
                // Second Page
                VStack(spacing: 5) {
                    
                    VStack() {
                        DropDownMenu(selectedOption: $viewModel.selectedTypeBet, options: viewModel.options)
                    }
                    .padding([.bottom], 15)
                    .frame(width: 340)
                    
                    
                    Group {
                        switch viewModel.selectedTypeBet {
                        case 0:
                            Text("bet_creation_yes_no_bottom_text_1")
                                .textStyle(weight: .bold, color: AllInColors.veryLightPurpleColor, size: 13)
                                .padding([.leading, .trailing], 20)
                            
                            Text("bet_creation_yes_no_bottom_text_2")
                                .textStyle(weight: .bold, color: AllInColors.veryLightPurpleColor, size: 13)
                            
                        case 2:
                            Text("bet_creation_custom_bottom_text_1")
                                .textStyle(weight: .bold, color: AllInColors.veryLightPurpleColor, size: 13)
                                .padding(.leading, 13)
                            
                            Text("bet_creation_custom_bottom_text_2")
                                .textStyle(weight: .bold, color: AllInColors.veryLightPurpleColor, size: 13)
                                .padding(.bottom, 15)
                            
                            if let responseError = $viewModel.responsesFieldError.wrappedValue {
                                Text(responseError)
                                    .textStyle(weight: .bold, color: .red, size: 10)
                            }
                            
                            VStack(spacing: 5) {
                                HStack(spacing: 0) {
                                    TextField("", text: $viewModel.response, prompt: Text("bet_creation_response_title")
                                        .foregroundColor(AllInColors.lightGrey200Color)
                                        .font(.system(size: 16))
                                        .fontWeight(.medium))
                                    .autocorrectionDisabled(true)
                                    .padding()
                                    .background(
                                        Rectangle()
                                            .fill(Color.white)
                                            .cornerRadius(9, corners: [.topLeft, .bottomLeft])
                                            .frame(height: 38)
                                    )
                                    .frame(width: 250, height: 38)
                                    .foregroundColor(.black)
                                    .onChange(of: viewModel.response) { newValue in
                                        if newValue.count > 20 {
                                            viewModel.response = String(newValue.prefix(20))
                                        }
                                    }
                                    
                                    Button(action: {
                                        if !viewModel.response.isEmpty && viewModel.values.count < 5 {
                                            viewModel.values.append(viewModel.response)
                                            updateGroupedItems()
                                            viewModel.response = ""
                                        }
                                    }) {
                                        Text("generic_add")
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 95, height: 40)
                                    .background(AllInColors.lightPurpleColor)
                                    .cornerRadius(10, corners: [.bottomRight, .topRight])
                                    .cornerRadius(2, corners: [.bottomLeft, .topLeft])
                                }
                                HStack {
                                    Spacer()
                                    Text(String(localized: "bet_creation_max_answers \(5 - viewModel.values.count)"))
                                        .textStyle(weight: .regular, color: AllInColors.primaryTextColor, size: 12)
                                    
                                }
                                VStack(spacing: 10) {
                                    ForEach(viewModel.groupedItems, id: \.self) { items in
                                        HStack {
                                            ForEach(items, id: \.self) { text in
                                                HStack {
                                                    Text(text)
                                                        .foregroundColor(.white)
                                                        .lineLimit(1)
                                                    Button(action: {
                                                        if let index = viewModel.values.firstIndex(of: text) {
                                                            viewModel.values.remove(at: index)
                                                            updateGroupedItems()
                                                        }
                                                    }) {
                                                        Image("crossIcon")
                                                            .resizable()
                                                            .frame(width: 15, height: 15)
                                                            .foregroundColor(.white)
                                                    }
                                                }
                                                .padding(5)
                                                .padding([.leading, .trailing], 5)
                                                .background(AllInColors.lightPurpleColor)
                                                .cornerRadius(16)
                                            }
                                            Spacer()
                                        }
                                    }
                                }
                            }
                        default:
                            Text("generic_in_waiting")
                        }
                    }
                    Spacer()
                }
                .padding([.leading, .trailing], 30)
                .padding(.top, 50)
                .tag(1)
            }
            .overlay(
                HStack {
                    Button(action: {
                        selectedTab = 0
                    }) {
                        Text("bet_creation_question")
                            .font(.system(size: 16))
                            .padding()
                            .fontWeight(selectedTab == 0 ? .bold : .semibold)
                            .foregroundColor(selectedTab == 0 ? AllInColors.primaryTextColor : .gray)
                            .offset(y: 0)
                    }
                    Button(action: {
                        selectedTab = 1
                    }) {
                        Text("bet_creation_answer")
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
        .onTapGesture {
            hideKeyboard()
        }
        .alert(isPresented: $viewModel.showErrorMessage) {
            Alert(title: Text("bet_creation_error"), message: Text(viewModel.errorMessage ?? ""), dismissButton: .default(Text("generic_ok")))
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(AllInColors.backgroundColor)
    }
}

struct CreationBetView_Previews: PreviewProvider {
    static var previews: some View {
        CreationBetView(showMenu: .constant(false))
            .preferredColorScheme(.dark)
    }
}
