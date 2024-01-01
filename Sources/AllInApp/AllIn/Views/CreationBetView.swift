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
    
    @State private var response = ""
    @State private var values: [String] = []
    
    @State private var selectedOption = 0
    let options: [(Int, String, String)] = [
        (0, "questionMarkIcon", "Oui / Non"),
        (1, "footballIcon", "Pari sportif"),
        (2, "paintbrushIcon", "Réponses personnalisées")
    ]
    
    @State var groupedItems: [[String]] = [[String]] ()

    private func updateGroupedItems() {
        
        var updatedGroupedItems: [[String]] = [[String]] ()
        var tempItems: [String] = [String] ()
        var width: CGFloat = 0
        var dynamicWidthLimit: CGFloat
        
        for value in values {
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
        
        groupedItems = updatedGroupedItems
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            TopBar(showMenu: self.$showMenu)
            TabView(selection: $selectedTab) {
                
                // First Page
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 5) {
                        VStack() {
                            HStack(spacing: 5) {
                                Text("Thème")
                                    .textStyle(weight: .bold, color: AllInColors.primaryTextColor, size: 17)
                                
                                Image("questionMarkGreyIcon")
                                    .resizable()
                                    .frame(width: 14, height: 14)
                                    .onTapGesture {
                                        showTitlePopover.toggle()
                                    }
                                    .allInPopover(isPresented: $showTitlePopover, paddingHorizontal: 20) {
                                        "Généralement un nom commun décrivant le thème global du pari pour servir de référence."
                                    }
                                
                                Spacer()
                            }
                            .frame(width:  340)
                            .padding(.leading, 10)
                            
                            TextField("", text: $viewModel.theme, prompt: Text("Études, sport, soirée...")
                                .foregroundColor(AllInColors.lightGrey300Color)
                                .font(.system(size: 14))
                                .fontWeight(.light))
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 9)
                                    .fill(AllInColors.componentBackgroundColor)
                                    .frame(height: 40)
                            )
                            .frame(width: 350, height: 40)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .stroke(AllInColors.delimiterGrey, lineWidth: 1)
                            )
                            .padding(.bottom, 5)
                        }
                        
                        HStack(spacing: 5) {
                            Text("Phrase du BET")
                                .textStyle(weight: .bold, color: AllInColors.primaryTextColor, size: 17)
                            
                            Image("questionMarkGreyIcon")
                                .resizable()
                                .frame(width: 14, height: 14)
                                .allInPopover(isPresented: $showDescriptionPopover, paddingHorizontal: 10) {
                                    "Court descriptif du pari, souvent une question ouverte ou fermée."
                                }
                            
                            Spacer()
                        }
                        .frame(width: 340)
                        .padding(.leading, 10)
                        
                        TextField("", text: $viewModel.description, prompt: Text("David sera absent Lundi matin en cours ?")
                            .foregroundColor(AllInColors.lightGrey300Color)
                            .font(.system(size: 14))
                            .fontWeight(.light), axis: .vertical)
                        .lineLimit(4, reservesSpace: true)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 9)
                                .fill(AllInColors.componentBackgroundColor)
                                .frame(height: 110)
                        )
                        .frame(width: 350, height: 110)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(AllInColors.delimiterGrey, lineWidth: 1)
                        )
                        .padding(.bottom, 30)
                        
                        HStack(spacing: 5) {
                            Text("Date de fin des inscriptions")
                                .textStyle(weight: .bold, color: AllInColors.primaryTextColor, size: 17)
                            Image("questionMarkGreyIcon")
                                .resizable()
                                .frame(width: 14, height: 14)
                                .allInPopover(isPresented: $showRegistrationEndDatePopover) {
                                    "Date de fin avant laquelle les joueurs peuvent s'inscrire en pariant leurs Allcoins."
                                }
                            
                            Spacer()
                        }
                        .frame(width:  340)
                        .padding(.leading, 10)
                        
                        HStack(spacing: 5) {
                            DatePicker(
                                "",
                                selection: $viewModel.endRegisterDate,
                                in: dateRange,
                                displayedComponents: [.date, .hourAndMinute]
                            )
                            .accentColor(AllInColors.lightPurpleColor)
                            .labelsHidden()
                            .padding(.bottom, 10)
                            Spacer()
                        }
                        .frame(width:  340)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            VStack() {
                                HStack(spacing: 5) {
                                    Text("Date de fin du BET")
                                        .textStyle(weight: .bold, color: AllInColors.primaryTextColor, size: 17)
                                    
                                    Image("questionMarkGreyIcon")
                                        .resizable()
                                        .frame(width: 14, height: 14)
                                        .allInPopover(isPresented: $showBetEndDatePopover) {
                                            "Date des résultats où seront redistribués les Allcoins aux vainqueurs."
                                        }
                                    
                                    Spacer()
                                }
                                .padding(.leading, 10)
                            }
                            DatePicker(
                                "",
                                selection: $viewModel.endBetDate,
                                in: dateRange,
                                displayedComponents: [.date, .hourAndMinute]
                            )
                            .accentColor(AllInColors.lightPurpleColor)
                            .labelsHidden()
                            .padding(.bottom, 40)
                        }
                        .frame(width: 340)
                        
                        VStack {
                            HStack(spacing: 5) {
                                Text("Confidentialité du BET")
                                    .textStyle(weight: .bold, color: AllInColors.primaryTextColor, size: 17)
                                Image("questionMarkGreyIcon")
                                    .resizable()
                                    .frame(width: 14, height: 14)
                                    .allInPopover(isPresented: $showConfidentialityPopover, paddingHorizontal: 15) {
                                        "Option permettant d'ouvrir ou non le pari à des inconnus."
                                    }
                                
                                Spacer()
                            }
                            .padding(.leading, 10)
                            
                            HStack(spacing: 5) {
                                ConfidentialityButton(image: "globe", text: "Public", selected: viewModel.isPublic)
                                    .onTapGesture {
                                        viewModel.isPublic = true
                                    }
                                    .padding(.trailing, 5)
                                
                                ConfidentialityButton(image: "lock", text: "Privé", selected: !viewModel.isPublic)
                                    .onTapGesture {
                                        viewModel.isPublic = false
                                    }
                                Spacer()
                            }
                        }
                        .frame(width: 340)
                        .padding(.bottom, 10)
                        
                        
                        VStack(spacing: 10) {
                            
                            if !self.viewModel.isPublic {
                                DropDownFriends()
                                    .padding(.bottom, 30)
                            }
                            
                            HStack() {
                                Spacer()
                                Text("Votre BET sera visible par tous les utilisateurs.")
                                    .textStyle(weight: .bold, color: AllInColors.veryLightPurpleColor, size: 13)
                                    .multilineTextAlignment(.center)
                                Spacer()
                            }
                            HStack() {
                                Spacer()
                                Text("Tout le monde pourra rejoindre le BET.")
                                    .textStyle(weight: .bold, color: AllInColors.veryLightPurpleColor, size: 13)
                                    .multilineTextAlignment(.center)
                                Spacer()
                            }
                            HStack() {
                                Spacer()
                                Text("Vous pourrez inviter des amis à tout moment pendant la période d’inscription.")
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
                                Text("Publier le bet")
                                    .font(.system(size: 24))
                                    .fontWeight(.bold)
                                    .overlay {
                                        AllInColors.primaryGradient.frame(width: 150)
                                            .mask(
                                                Text("Publier le bet")
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
                        DropDownMenu(selectedOption: $selectedOption, options: options)
                    }
                    .padding([.bottom], 15)
                    .frame(width: 340)
                    
                    
                    Group {
                        switch selectedOption {
                        case 0:
                            Text("Les utilisateurs devront répondre au pari avec OUI ou NON.")
                                .textStyle(weight: .bold, color: AllInColors.veryLightPurpleColor, size: 13)
                                .padding([.leading, .trailing], 20)
                            
                            Text("Aucune autre réponse ne sera acceptée.")
                                .textStyle(weight: .bold, color: AllInColors.veryLightPurpleColor, size: 13)
                            
                        case 2:
                            Text("Vous allez renseigner les différentes réponses disponibles dans ce pari.")
                                .textStyle(weight: .bold, color: AllInColors.veryLightPurpleColor, size: 13)
                                .padding(.leading, 13)
                            
                            Text("Faites attention a etre claire et éviter toutes incertitudes")
                                .textStyle(weight: .bold, color: AllInColors.veryLightPurpleColor, size: 13)
                                .padding(.bottom, 15)
                            
                            VStack(spacing: 5) {
                                HStack(spacing: 0) {
                                    TextField("", text: $response, prompt: Text("Intitulé de réponse")
                                        .foregroundColor(AllInColors.lightGrey200Color)
                                        .font(.system(size: 16))
                                        .fontWeight(.medium))
                                    .padding()
                                    .background(
                                        Rectangle()
                                            .fill(Color.white)
                                            .cornerRadius(9, corners: [.topLeft, .bottomLeft])
                                            .frame(height: 38)
                                    )
                                    .frame(width: 250, height: 38)
                                    .foregroundColor(.black)
                                    .onChange(of: response) { newValue in
                                        if newValue.count > 20 {
                                            response = String(newValue.prefix(20))
                                        }
                                    }
                                    
                                    Button(action: {
                                        if !response.isEmpty && values.count < 5 {
                                            values.append(response)
                                            updateGroupedItems()
                                            response = ""
                                        }
                                    }) {
                                        Text("Ajouter")
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 95, height: 40)
                                    .background(AllInColors.lightPurpleColor)
                                    .cornerRadius(10, corners: [.bottomRight, .topRight])
                                    .cornerRadius(2, corners: [.bottomLeft, .topLeft])
                                }
                                HStack {
                                    Spacer()
                                    Text("encore \(5 - values.count) max.")
                                        .textStyle(weight: .regular, color: AllInColors.primaryTextColor, size: 12)
                                    
                                }
                                VStack(spacing: 10) {
                                    ForEach(groupedItems, id: \.self) { items in
                                        HStack {
                                            ForEach(items, id: \.self) { text in
                                                HStack {
                                                    Text(text)
                                                        .foregroundColor(.white)
                                                        .lineLimit(1)
                                                    Button(action: {
                                                        if let index = values.firstIndex(of: text) {
                                                            values.remove(at: index)
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
                            Text("En attente")
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
                        Text("Question")
                            .font(.system(size: 16))
                            .padding()
                            .fontWeight(selectedTab == 0 ? .bold : .semibold)
                            .foregroundColor(selectedTab == 0 ? AllInColors.primaryTextColor : .gray)
                            .offset(y: 0)
                    }
                    Button(action: {
                        selectedTab = 1
                    }) {
                        Text("Réponses")
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
