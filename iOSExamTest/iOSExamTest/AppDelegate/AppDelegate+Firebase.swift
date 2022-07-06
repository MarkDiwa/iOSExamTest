//
//  AppDelegate+Firebase.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 6/30/22.
//

import Foundation
import FirebaseAuth
import FirebaseCore

extension AppDelegate {
    func setupFirebase() {
        FirebaseApp.configure()
        
        guard Auth.auth().currentUser != nil else {
            return
        }
        
        App.shared.retrieveUserDataInStorage()
    }
}
