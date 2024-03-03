//
//  Provider.swift
//  AllInWidgetsExtension
//
//  Created by Emre on 01/03/2024.
//

import WidgetKit
import Intents

let allInApi = "https://codefirst.iut.uca.fr/containers/AllDev-api/"

struct Provider: IntentTimelineProvider {

    func placeholder(in context: Context) -> User {
        User(date: Date())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (User) -> ()) {
        var entry = User(date: Date())
        entry.connected = true
        entry.username = "toto"
        entry.coins = 50000
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<User>) -> ()) {
        let currentDate = Date()
        
        Task {
            if var userData = try? await fetchData() {
                userData.date = currentDate
                let nextUpdate = Calendar.current.date(byAdding: .minute, value: 5, to: currentDate)!
                let timeline = Timeline(entries: [userData], policy: .after(nextUpdate))
                completion(timeline)
            }
        }
    }
    
    func fetchData() async throws -> User {
        let defaults = UserDefaults(suiteName: "group.alldev.AllIn")

        guard let token = defaults?.string(forKey: "authenticationRefresh") else {
            return User()
        }
                
        let url = URL(string: allInApi + "users/token")!
        var request = URLRequest(url: url)

        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
            if let userData = try? JSONDecoder().decode(User.self, from: data) {
                var updatedUser = userData
                updatedUser.connected = true
                return updatedUser
            }
        }
        return User()
    }

}

struct User: TimelineEntry, Codable {
    var date: Date = .init()
    var coins: Int = 0
    var username: String = ""
    var connected: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case coins = "nbCoins"
        case username = "username"
    }
}
