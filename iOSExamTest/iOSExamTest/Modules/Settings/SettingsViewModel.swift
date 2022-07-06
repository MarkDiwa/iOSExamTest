//
//  SettingsViewModel.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/6/22.
//

import Foundation
import FirebaseAuth

class SettingsViewModel: SettingsViewModelProtocol {
    
}

// MARK: - Methods

extension SettingsViewModel {
    func logout() {
        try? Auth.auth().signOut()
        App.shared.user = nil
        NotificationCenter
            .default
            .post(name: .userDidLogout,
                  object: self)
        
    }
}
