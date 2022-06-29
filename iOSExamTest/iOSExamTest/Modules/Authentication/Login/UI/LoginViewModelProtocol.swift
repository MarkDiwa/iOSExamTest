//
//  LoginViewModelProtocol.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 6/30/22.
//

import Foundation

protocol LoginViewModelProtocol {
    func login(withEmail email: String,
               password: String,
               onSuccess: @escaping VoidResult,
               onError: @escaping ErrorResult)
    
    func register(withEmail email: String,
                  password: String,
                  onSuccess: @escaping VoidResult,
                  onError: @escaping ErrorResult)
    
    func validateUserInputs() -> UserInputValidity
}
