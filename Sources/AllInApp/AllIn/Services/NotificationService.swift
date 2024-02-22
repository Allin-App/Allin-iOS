//
//  NotificationService.swift
//  AllIn
//
//  Created by Emre on 22/02/2024.
//

import UserNotifications

struct NotificationItem {
    var title: String
    var content: String
    var interval: TimeInterval
}

class NotificationService: ObservableObject {
    
    @Published var notifications: [NotificationItem] = []
    
    func scheduleNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Permission for notifications granted.")
            } else {
                print("Permission for notifications denied.")
            }
        }
    }
    
    func loadNotifications() {
        for notification in notifications {
            scheduleNotification(with: notification)
        }
    }
    
    func removeAllNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    func scheduleNotification(with item: NotificationItem) {
        let content = UNMutableNotificationContent()
        content.title = item.title
        content.body = item.content
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: item.interval, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
