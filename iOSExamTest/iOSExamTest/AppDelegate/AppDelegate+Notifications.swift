//
//  AppDelegate+Notifications.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 6/30/22.
//

import Foundation

extension AppDelegate {
    
    func setupNotificationObservers() {
        let notificationCenter = NotificationCenter.default
        
        setupUserLoggedInObserver(withNotificationCenter: notificationCenter)
        setupUserLoggedOut(withNotificationCenter: notificationCenter)
    }
    
    private func setupUserLoggedInObserver(withNotificationCenter notifCenter: NotificationCenter) {
        notifCenter.addObserver(self,
                                selector: #selector(presentDashboard),
                                name: .userDidLogin,
                                object: nil)
    }
    
    private func setupUserLoggedOut(withNotificationCenter notifCenter: NotificationCenter) {
        notifCenter.addObserver(self,
                                selector: #selector(presentLoginViewController),
                                name: .userDidLogout,
                                object: nil)
    }
    
}
