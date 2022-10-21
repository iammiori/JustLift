//
//  JustLiftApp.swift
//  JustLift
//
//  Created by miori Lee on 2022/09/22.
//

import SwiftUI
import Firebase

@main
struct JustLiftApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let storage: LiftlogStorage = LiftlogStorage()
            let vm = LiftListViewModel(storage: storage)
            LiftListView(viewModel: vm)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    //앱이 켜졌을때 발동
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Use Firebase library to configure APIs
        // 파이어베이스 설정
        FirebaseApp.configure()
        
        //원격알림 등록
        if #available(iOS 10.0, *) {
          // For iOS 10 display notification (sent via APNS)
          UNUserNotificationCenter.current().delegate = self

          let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
          UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { _, _ in }
          )
        } else {
          let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
          application.registerUserNotificationSettings(settings)
        }

        application.registerForRemoteNotifications()
        
        //메시지 대리자 설정
        Messaging.messaging().delegate = self
        
        //push foreground 설정
        UNUserNotificationCenter.current().delegate = self
        
        return true
    }
    
    //fcm token 이 등록되었을때, apns token 과 연결
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    //push가 앱이 켜저있을때 나올때
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        print("will Present \(userInfo)")
        completionHandler([.banner, .sound, .badge])
    }
    
    //push 받았을때
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        print("did Receive \(userInfo)")
        completionHandler()
        
    }
}

extension AppDelegate: MessagingDelegate {
    //파베 토큰 받았는지 (fcm 등록 토큰 받았을때)
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("token 받음 : \(String(describing: fcmToken))")
    }
}
