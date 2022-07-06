//
//  App.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/5/22.
//

import Foundation

class App {
    private let userDataKey = "app.userdata.key"
    
    static let shared: App = App()
    
    var user: User? {
        didSet {
            saveUserData()
        }
    }
    
    func saveUserData() {
        guard let user = user else { return }
        
        UserDefaults.standard.set(user.dictionary, forKey: userDataKey)
    }
    
    func retrieveUserDataInStorage() {
        let data = UserDefaults.standard.object(forKey: userDataKey) as? [String: Any]
        
        user = try? User.decode(data ?? [:])
    }
    
    private init() {}
}
