//
//  RegistrationViewModelProtocol.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/6/22.
//

import Foundation

protocol RegistrationViewModelProtocol {
    
    func register(emailString: String,
                  usernameString: String,
                  passwordString: String,
                  onSuccess: @escaping VoidResult,
                  onError: @escaping ErrorResult)
}
