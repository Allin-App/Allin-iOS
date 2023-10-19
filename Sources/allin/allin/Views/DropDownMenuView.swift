//
//  DropDownMenuView.swift
//  AllIn
//
//  Created by étudiant on 19/10/2023.
//

import SwiftUI

struct DropDownMenuView: View {
    
    @State var expand = false
    @Binding var selectedOption: Int
    var options: [(Int, String, String)]
    
    var body: some View {
        VStack(spacing: 0, content: {
            Button(action: { self.expand.toggle() }) {
                HStack{
                    Image(options[selectedOption].1)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                    Text(options[selectedOption].2).fontWeight(.bold).foregroundColor(AllinColor.PrimaryTextColor).font(.system(size: 15))
                    Spacer()
                    Image(expand ? "chevron_up" : "chevron_down").resizable().frame(width: 15, height: 10).scaledToFill()
                }
                .padding([.leading, .trailing], 15)
                .frame(height: 43)
            }
            if expand {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(AllinColor.VeryLightGray)
                    .padding(.bottom, 18)
                VStack(spacing: 0) {
                    ForEach(0..<options.count, id: \.self) { index in
                        if options[index].0 != selectedOption {
                            Button(action: {self.selectedOption = options[index].0
                            self.expand.toggle()}) {
                                HStack{
                                    Image(options[index].1)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 15, height: 15)
                                    Text(options[index].2).fontWeight(.bold).foregroundColor(AllinColor.PrimaryTextColor).font(.system(size: 15))
                                    Spacer()
                                }
                            }
                            .padding(.bottom, 15)
                        }
                    }
                }
                .padding([.leading, .trailing], 15)
            }
        })
        .frame(width: 345)
        .background(.white)
        .cornerRadius(10)
    }
}
