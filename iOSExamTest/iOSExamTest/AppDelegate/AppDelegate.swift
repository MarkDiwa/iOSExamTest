//
//  AppDelegate.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 6/29/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupFirebase()
        setupNotificationObservers()
        setupInitialViewController()
        return true
    }

}
