//
//  Extensions.swift
//  AllIn
//
//  Created by Lucas on 20/09/2023.
//

import Foundation
import SwiftUI

extension Text {
    func textStyle(weight: Font.Weight, color: Color, size: CGFloat) -> Text {
        return self
            .fontWeight(weight)
            .foregroundColor(color)
            .font(.system(size: size))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}

struct EdgeBorder: Shape {
    var width: CGFloat
    var edges: [Edge]

    func path(in rect: CGRect) -> Path {
        edges.map { edge -> Path in
            switch edge {
            case .top: return Path(.init(x: rect.minX, y: rect.minY, width: rect.width, height: width))
            case .bottom: return Path(.init(x: rect.minX, y: rect.maxY - width, width: rect.width, height: width))
            case .leading: return Path(.init(x: rect.minX, y: rect.minY, width: width, height: rect.height))
            case .trailing: return Path(.init(x: rect.maxX - width, y: rect.minY, width: width, height: rect.height))
            }
        }.reduce(into: Path()) { $0.addPath($1) }
    }
}

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

extension View {
    func allInPopover(isPresented: Binding<Bool>, paddingHorizontal: CGFloat = 15, content: @escaping () -> String, textColor: Color = .white, fontSize: CGFloat = 12, frameWidth: CGFloat = 270) -> some View {
        self.onTapGesture {
            isPresented.wrappedValue.toggle()
        }
        .popover(isPresented: isPresented, attachmentAnchor: .point(.top)) {
            ZStack {
                AllInColors.primaryColor // Couleur de fond
                    .edgesIgnoringSafeArea(.all)

                VStack(alignment: .leading, spacing: 12) {
                    Text(content())
                        .textStyle(weight: .regular, color: textColor, size: fontSize)
                }
                .padding([.leading, .trailing], paddingHorizontal)
                .frame(width: frameWidth)
                .presentationCompactAdaptation(.popover)
            }
        }
    }
}
