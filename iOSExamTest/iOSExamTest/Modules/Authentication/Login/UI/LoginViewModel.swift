//
//  LoginViewModel.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 6/30/22.
//

import Foundation
import FirebaseAuth

class LoginViewModel: LoginViewModelProtocol {}

// MARK: - Event Handlers

private extension LoginViewModel {
    func handleLoginSuccess(onCompletion: VoidResult?) -> SingleResult<AuthDataResult?> {
        return { apiResult in
            
            guard let authResult = apiResult else { return }
            App.shared.user = User(id: authResult.user.uid,
                                   name: "",
                                   email: authResult.user.email ?? "")
            NotificationCenter
                .default
                .post(name: .userDidLogin,
                      object: self)
            
            onCompletion?()
        }
    }
    
    func handleRegistrationSuccess(onCompletion: VoidResult?) -> SingleResult<AuthDataResult?> {
        return { _ in
            onCompletion?()
        }
    }
}

// MARK: - Methods

extension LoginViewModel {
    func login(withEmail email: String,
               password: String,
               onSuccess: @escaping VoidResult,
               onError: @escaping ErrorResult) {
        let creds = UserCredentials(email: email,
                                    password: password)
        
        login(withCredential: creds,
              onSuccess: handleLoginSuccess(onCompletion: onSuccess),
              onError: onError)
    }
    
    func register(withEmail email: String,
                  password: String,
                  onSuccess: @escaping VoidResult,
                  onError: @escaping ErrorResult) {
        let creds = UserCredentials(email: email,
                                    password: password)
        
        register(withCredential: creds,
                 onSuccess: handleRegistrationSuccess(onCompletion: onSuccess),
                 onError: onError
        )
    }
    
    func validateUserInputs() -> UserInputValidity {
        return .valid
    }
}

// MARK: - FirebaseAuthenticatorManager

extension LoginViewModel: FirebaseAuthenticatorManager {}
