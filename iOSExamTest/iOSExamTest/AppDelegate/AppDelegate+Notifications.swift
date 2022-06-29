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
        setupUserCompleteOnboardingObserver(withNotificationCenter: notificationCenter)
    }
    
    private func setupUserLoggedInObserver(withNotificationCenter notifCenter: NotificationCenter) {
        notifCenter.addObserver(self,
                                       selector: #selector(presentDashboard),
                                       name: .userDidLogin,
                                       object: nil)
    }
    
    private func setupUserCompleteOnboardingObserver(withNotificationCenter notifCenter: NotificationCenter) {
        notifCenter.addObserver(self,
                                selector: #selector(presentDashboard),
                                name: .userDidCompleteOnboarding,
                                object: nil)
    }
    
}
