//
//  Notifications.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 6/30/22.
//

import Foundation

extension Notification.Name {
    private static var prefix: String { "com.mddiwa.iOSExamTest.notifications" }
    
    static let userDidLogin = Notification.Name(rawValue: "\(prefix).userDidLogin")
    
    static let userDidLogout = Notification.Name(rawValue: "\(prefix).userDidLogout")
}
