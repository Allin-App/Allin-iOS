//
//  ChoiceCapsule.swift
//  AllIn
//
//  Created by étudiant on 26/09/2023.
//

import SwiftUI

struct ChoiceCapsule: View {
    @State var buttonPressed = false
    var body: some View {
        Group {
            if(buttonPressed){
                Text("En cours").font(.system(size: 15)).foregroundColor(.white).fontWeight(.semibold).padding([.leading,.trailing],13.8).padding([.top,.bottom], 7).background(AllinColor.PrimaryTextColor).clipShape(Capsule()
                )
            }else{
                Text("En cours").font(.system(size: 15)).foregroundColor(AllinColor.lightGray).fontWeight(.regular).padding([.leading,.trailing],15).padding([.top,.bottom], 7).background(AllinColor.CapsuleGray).clipShape(Capsule()).overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(AllinColor.LightGray_200, lineWidth: 1)
                )
            }
        }
        .onTapGesture() {
            buttonPressed.toggle()
        }
        
    }
}

struct ChoiceCapsule_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceCapsule()
    }
}
