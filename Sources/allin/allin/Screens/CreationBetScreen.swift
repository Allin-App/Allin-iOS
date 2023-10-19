//
//  CreationBetScreen.swift
//  AllIn
//
//  Created by étudiant on 29/09/2023.
//

import SwiftUI

struct CreationBet: View {
    
    @State private var selectedTab = 0
    @Binding var showMenu: Bool
    @State var selectedConfidentiality = true
    @State private var theme: String = ""
    @State private var description: String = ""
    @State var present = false
    @State private var startDate = Date()
    @State private var endDate = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startDate = Date()
        let endDate = calendar.date(byAdding: .year, value: 10, to: startDate)!
        return startDate ... endDate
    }()
    @State private var response = ""
    @State private var values: [String] = []
    
    @State private var selectedOption = 0
    let options: [(Int, String, String)] = [
            (0, "globe", "Oui / Non"),
            (1, "futbol", "Pari sportif"),
            (2, "paintbrush", "Réponses personnalisées")
        ]
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            TopBarView(showMenu: self.$showMenu)
            TabView(selection: $selectedTab) {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 5) {
                        VStack() {
                            HStack(spacing: 5) {
                                Text("Thème")
                                    .font(.system(size: 17))
                                    .fontWeight(.bold)
                                    .foregroundColor(AllinColor.TitleCreationBetColor)
                                Image("circle-question-regular")
                                    .resizable()
                                    .frame(width: 14, height: 14)
                                Spacer()
                            }
                            .padding(.leading, 10)
                            TextField("", text: $theme, prompt: Text("Études, sport, soirée...").foregroundColor(AllinColor.PlaceholderGrayColor).font(.system(size: 14)).fontWeight(.light))
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 9)
                                        .fill(.white)
                                        .frame(height: 40)
                                )
                                .frame(width: 350, height: 40)
                                .foregroundColor(.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .stroke(AllinColor.LightGray_200, lineWidth: 1)
                                )
                                .padding(.bottom, 5)
                        }
                        
                        HStack(spacing: 5) {
                            Text("Phrase du BET")
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .foregroundColor(AllinColor.TitleCreationBetColor)
                            Image("circle-question-regular")
                                .resizable()
                                .frame(width: 14, height: 14)
                            Spacer()
                        }
                        .padding(.leading, 10)
                        TextField("", text: $description, prompt: Text("Études, sport, soirée...").foregroundColor(AllinColor.PlaceholderGrayColor).font(.system(size: 14)).fontWeight(.light), axis: .vertical)
                            .lineLimit(4, reservesSpace: true)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 9)
                                    .fill(Color.white)
                                    .frame(height: 110)
                            )
                            .frame(width: 350, height: 110)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .stroke(AllinColor.LightGray_200, lineWidth: 1)
                            )
                            .padding(.bottom, 30)
                        
                        HStack(spacing: 5) {
                            Text("Date de fin des inscriptions")
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .foregroundColor(AllinColor.TitleCreationBetColor)
                            Image("circle-question-regular")
                                .resizable()
                                .frame(width: 14, height: 14)
                            Spacer()
                        }
                        .padding(.leading, 10)
                        DatePicker(
                                "",
                                 selection: $startDate,
                                 in: dateRange,
                                 displayedComponents: [.date, .hourAndMinute]
                            )
                        .accentColor(AllinColor.PrimaryTextColor)
                        .labelsHidden()
                        .padding(.bottom, 10)
                        VStack(alignment: .leading, spacing: 5) {
                            VStack() {
                                HStack(spacing: 5) {
                                    Text("Date de fin du BET")
                                        .font(.system(size: 17))
                                        .fontWeight(.bold)
                                        .foregroundColor(AllinColor.TitleCreationBetColor)
                                    Image("circle-question-regular")
                                        .resizable()
                                        .frame(width: 14, height: 14)
                                    Spacer()
                                }
                                .padding(.leading, 10)
                            }
                            DatePicker(
                                    "",
                                     selection: $endDate,
                                     in: dateRange,
                                     displayedComponents: [.date, .hourAndMinute]
                                )
                            .accentColor(AllinColor.PrimaryTextColor)
                            .labelsHidden()
                            .padding(.bottom, 40)
                        }
                        VStack {
                            HStack(spacing: 5) {
                                Text("Confidentialité du BET")
                                    .font(.system(size: 17))
                                    .fontWeight(.bold)
                                    .foregroundColor(AllinColor.TitleCreationBetColor)
                                Image("circle-question-regular")
                                    .resizable()
                                    .frame(width: 14, height: 14)
                                Spacer()
                            }
                            .padding(.leading, 10)
                            HStack(spacing: 5) {
                                ConfidentialityView(image: "globe-solid", text: "Public", selected: selectedConfidentiality)
                                    .onTapGesture {
                                        selectedConfidentiality = true
                                    }
                                    .padding(.trailing, 5)
                                ConfidentialityView(image: "lock-solid", text: "Privé", selected: !selectedConfidentiality)
                                    .onTapGesture {
                                        selectedConfidentiality = false
                                    }
                                Spacer()
                            }
                        }
                        .padding(.bottom, 10)
                        VStack(spacing: 10) {
                            Text("Votre BET sera visible par tous les utilisateurs.")
                                .font(.system(size: 13))
                                .fontWeight(.bold)
                                .padding(.leading, 35)
                                .foregroundColor(AllinColor.PurpleLight)
                                .multilineTextAlignment(.center)
                            Text("Tout le monde pourra rejoindre le BET.")
                                .font(.system(size: 13))
                                .fontWeight(.bold)
                                .padding(.leading, 35)
                                .foregroundColor(AllinColor.PurpleLight)
                                .multilineTextAlignment(.center)
                            Text("Vous pourrez inviter des amis à tout moment pendant la période d’inscription.")
                                .font(.system(size: 13))
                                .padding(.leading, 35)
                                .fontWeight(.bold)
                                .foregroundColor(AllinColor.PurpleLight)
                                .multilineTextAlignment(.center)
                                
                        }
                        Spacer()
                        HStack() {
                            Spacer()
                            Button(action: {}) {
                                Text("Publier le bet")
                                    .font(.system(size: 24))
                                    .fontWeight(.bold)
                                    .foregroundColor(.purple)
                                    .overlay {
                                        AllinColor.gradiantCard.frame(width: 150)
                                        .mask(
                                            Text("Publier le bet")
                                                .font(.system(size: 24))
                                                .fontWeight(.bold)
                                                .frame(maxWidth: .infinity)
                                        )
                                    }
                            }
                            .frame(width: 335, height: 60)
                            .background(.white)
                            .cornerRadius(12)
                            Spacer()
                        }
                    }
                    .padding([.leading, .trailing, .bottom], 30)
                    .padding(.top, 50)
                }
                .tag(0)
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    VStack() {
                        DropDownMenuView(selectedOption: $selectedOption, options: options)
                    }
                    .padding([.bottom], 15)
                    
                
                    Group {
                        switch selectedOption {
                        case 0:
                            Text("Les utilisateurs devront répondre au pari avec OUI ou NON.")
                                .font(.system(size: 13))
                                .fontWeight(.bold)
                                .padding(.leading, 40)
                                .foregroundColor(AllinColor.PurpleLight)
                            Text("Aucune autre réponse ne sera acceptée.")
                                .font(.system(size: 13))
                                .fontWeight(.bold)
                                .padding(.leading, 40)
                                .foregroundColor(AllinColor.PurpleLight)
                        case 2:
                            Text("Vous allez renseigner les différentes réponses disponibles dans ce pari.")
                                .font(.system(size: 13))
                                .fontWeight(.bold)
                                .padding(.leading, 40)
                                .foregroundColor(AllinColor.PurpleLight)
                            Text("Faites attention a etre claire et éviter toutes incertitudes")
                                .font(.system(size: 13))
                                .fontWeight(.bold)
                                .padding(.leading, 40)
                                .padding(.bottom, 15)
                                .foregroundColor(AllinColor.PurpleLight)
                            VStack(spacing: 5) {
                                HStack(spacing: 0) {
                                    TextField("", text: $response, prompt: Text("Intitulé de réponse").foregroundColor(AllinColor.PlaceholderLightGrayColor).font(.system(size: 16)).fontWeight(.medium))
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
                                            response = ""
                                        }
                                    }) {
                                        Text("Ajouter")
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 95, height: 40)
                                    .background(AllinColor.PrimaryTextColor)
                                    .cornerRadius(10, corners: [.bottomRight, .topRight])
                                    .cornerRadius(2, corners: [.bottomLeft, .topLeft])
                                }
                                HStack {
                                    Spacer()
                                    Text("encore \(5 - values.count) max.")
                                        .font(.system(size: 12))
                                        .fontWeight(.regular)
                                        .foregroundColor(AllinColor.GrayTextColor)
                                }
                                HStack(spacing: 10) {
                                    ForEach(values, id: \.self) { text in
                                        HStack {
                                            Text(text)
                                                .foregroundColor(.white)
                                                .lineLimit(1)
                                            Button(action: {
                                                if let index = values.firstIndex(of: text) {
                                                    values.remove(at: index)
                                                }
                                            }) {
                                                Image("cross")
                                                    .resizable()
                                                    .frame(width: 10, height: 10)
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        .padding(5)
                                        .padding([.leading, .trailing], 8)
                                        .background(AllinColor.PrimaryTextColor)
                                        .cornerRadius(16)
                                    }
                                }
                            }
                        default:
                            Text("En attente")
                        }
                    }
                    Spacer()
                }
                .padding([.leading, .trailing, .bottom], 30)
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
                            .foregroundColor(selectedTab == 0 ? AllinColor.TitleCreationBetColor : Color.gray)
                            .offset(y: 0)
                    }
                    Button(action: {
                        selectedTab = 1
                    }) {
                        Text("Réponses")
                            .font(.system(size: 16))
                            .padding()
                            .fontWeight(selectedTab == 1 ? .bold : .semibold)
                            .foregroundColor(selectedTab == 1 ? AllinColor.TitleCreationBetColor : Color.gray)
                            .offset(y: 0)
                    }
                }
            , alignment: .top)
            .tabViewStyle(PageTabViewStyle())
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom).background(AllinColor.backgroundWhite)
    }
}
