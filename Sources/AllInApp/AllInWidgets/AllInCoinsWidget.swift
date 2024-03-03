//
//  AllInCoinsWidgets.swift
//  AllInCoinsWidgets
//
//  Created by Emre on 01/03/2024.
//

import WidgetKit
import SwiftUI

struct AllInCoinsWidgetEntryView : View {
    var user: Provider.Entry
    
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        switch family {
        case .systemSmall:
            SmallSizedWidget()
        case .systemMedium:
            MediumSizedWidget()
        case .accessoryRectangular:
            LockScreenRectangularWidget()
        case .accessoryInline:
            LockScreenInlineWidget()
        case .accessoryCircular:
            LockScreenCircularWidget()
        default:
            Text("Not implemented")
        }
    }
    
    @ViewBuilder
    func LockScreenInlineWidget() -> some View {
        if user.connected {
            Text("💸 " + user.coins.abbreviated())
                .bold()
                .font(.headline)
                .foregroundColor(.white)
            
        } else {
            Text("💸 Connexion")
                .bold()
                .font(.headline)
                .foregroundColor(.white)
        }
        
    }
    
    @ViewBuilder
    func LockScreenCircularWidget() -> some View {
        if user.connected {
            Gauge(value: Float(user.coins) / 10000) {
                Text(user.coins.abbreviated())
            }
            .gaugeStyle(.accessoryCircular)
        } else {
            ZStack {
                Image("launchScreenImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                VStack {
                    Text("Vide")
                    Text("All In")
                }
            }
        }
    }
    
    @ViewBuilder
    func LockScreenRectangularWidget() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Image("allcoinIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                
                if user.connected {
                    VStack(alignment: .leading) {
                        Text(user.coins.abbreviated())
                            .fontWeight(.bold)
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text(user.username.description.capitalized + ", venez jouez !")
                            .font(.caption2)
                            .foregroundColor(.white)
                    }
                } else {
                    Text("Connexion")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
            
            Text("All In")
                .font(.callout)
                .fontWeight(.semibold)
        }
    }
    
    @ViewBuilder
    func SmallSizedWidget() -> some View {
        ZStack {
            Image("launchScreenImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            VStack {
                HStack {
                    Image("allcoinWhiteIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                    
                    if user.connected {
                        VStack(alignment: .leading) {
                            Text(user.coins.abbreviated())
                                .fontWeight(.bold)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Text(user.username.description.capitalized + ", venez jouez !")
                                .font(.caption2)
                                .foregroundColor(.white)
                        }
                    } else {
                        Text("Connexion")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func MediumSizedWidget() -> some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color("PinkAccentColor"), Color("PurpleAccentColor"), Color("BlueAccentColor")]), startPoint: .top, endPoint: .bottom))
            
            VStack {
                HStack {
                    Image("allcoinWhiteIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 45, height: 45)
                    
                    if user.connected {
                        VStack(alignment: .leading) {
                            Text(user.coins.abbreviated())
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(.white)
                            
                            Text(user.username.description.capitalized + ", venez jouez !")
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                    } else {
                        Text("Connexion")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct AllInCoinsWidget: Widget {
    let kind: String = "AllInCoinsWidgets"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            AllInCoinsWidgetEntryView(user: entry)
        }
        .configurationDisplayName("All Coins")
        .description("Visualiser rapidement votre nombre de all coins restants.")
        .supportedFamilies([.systemSmall, .systemMedium, .accessoryRectangular, .accessoryInline, .accessoryCircular])
        
    }
}

struct AllInCoinsWidget_Previews: PreviewProvider {
    static var previews: some View {
        AllInCoinsWidgetEntryView(user: User(date: Date(), coins: 1000, username: "test", connected: false))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        
        AllInCoinsWidgetEntryView(user: User(date: Date(), coins: 1000, username: "test", connected: true))
         .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

extension Int {
    func abbreviated() -> String {
        if self < 1000 {
            return "\(self)"
        }
        let abbreviations = ["", "K", "M", "B", "T"]
        var num = Double(self)
        var index = 0
        while num >= 1000 && index < abbreviations.count - 1 {
            num /= 1000
            index += 1
        }
        return String(format: "%.1f%@", num, abbreviations[index])
    }
}
