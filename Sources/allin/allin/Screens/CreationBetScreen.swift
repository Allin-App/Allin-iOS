//
//  CreationBetScreen.swift
//  AllIn
//
//  Created by étudiant on 29/09/2023.
//

import SwiftUI

struct CreationBet: View {
    
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
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            TopBarView(showMenu: self.$showMenu)
            TabView {
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
                                        .fill(Color.white)
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
                            HStack() {
                                DatePicker(
                                        "",
                                         selection: $endDate,
                                         in: dateRange,
                                         displayedComponents: [.date, .hourAndMinute]
                                    )
                                .accentColor(AllinColor.PrimaryTextColor)
                                .labelsHidden()
                                Spacer()
                            }
                        }
                        .padding(.bottom, 40)
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
                                ConfidentialityView(image: "globe", text: "Public", selected: selectedConfidentiality)
                                    .onTapGesture {
                                        selectedConfidentiality = true
                                    }
                                    .padding(.trailing, 5)
                                ConfidentialityView(image: "lock", text: "Privé", selected: !selectedConfidentiality)
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
                    .padding([.leading,.trailing, .top, .bottom], 30)
                }
                
                Text("Hello")
            }
            .tabViewStyle(PageTabViewStyle())
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom).background(AllinColor.backgroundWhite)
    }
}
