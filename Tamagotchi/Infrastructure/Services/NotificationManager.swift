//
//  NotificationManager.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/19.
//

import Foundation
import UserNotifications

final class NotificationManager {

    enum NotificationKey: String {
        case feedingNotice

        var identifier: String {
            return self.rawValue
        }
    }

    static let shared = NotificationManager()

    let userNotification = UNUserNotificationCenter.current()

    private init() {}

}

extension NotificationManager {

    func requestNotificationAuthority() {
        // 노티피케이션 권한 옵션
        let authOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)

        UNUserNotificationCenter.current()
            .requestAuthorization(options: authOptions) { isAllowed, error in
                if isAllowed {

                } else {
                    print("error")
                }

                if let error {
                    debugPrint(error)
                }
        }
    }

    func resignNotification(key: NotificationKey) {

        userNotification.getPendingNotificationRequests { requests in
            print("111")
            debugPrint(requests)
            print("444")
        }
        userNotification.getDeliveredNotifications { requests in
            print("222")
            debugPrint(requests)
            print("333")
        }

        userNotification.removePendingNotificationRequests(withIdentifiers: [key.identifier])
        userNotification.removeDeliveredNotifications(withIdentifiers: [key.identifier])
    }

    func sendFeedingNoticeNotification() {
        sendNotification(
            title: "다마고치에게 밥과 물을 주세요!",
            body: "밥과 물을 많이 줄 수록, 빠르게 성장한답니다ㅎㅎ",
            seconds: 60,
            isRepeat: true,
            key: .feedingNotice
        )
    }

}

private extension NotificationManager {

    func sendNotification(
        title: String,
        body: String,
        seconds: Double,
        isRepeat: Bool,
        key: NotificationKey
    ) {
        let notificationContent = UNMutableNotificationContent()

        notificationContent.title = title
        notificationContent.body = body

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: isRepeat)
        let request = UNNotificationRequest(
            identifier: key.identifier,
            content: notificationContent,
            trigger: trigger
        )

        userNotification.add(request) { error in
            if let error {
                debugPrint(error)
            }
        }
    }

}
