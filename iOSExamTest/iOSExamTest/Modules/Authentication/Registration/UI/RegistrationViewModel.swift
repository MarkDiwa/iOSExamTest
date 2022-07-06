//
//  RegistrationViewModel.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/6/22.
//

import Foundation
import FirebaseAuth

class RegistrationViewModel: RegistrationViewModelProtocol {
    private let api: ProfileAPI
    
    init(api: ProfileAPI = ProfileAPI()) {
        self.api = api
    }
}


// MARK: - Event Handlers

private extension RegistrationViewModel {
    func handleRegistrationSuccess(emailString: String,
                                   usernameString: String,
                                   onCompletion: @escaping VoidResult,
                                   onAddProfileError: @escaping ErrorResult) -> SingleResult<AuthDataResult?> {
        return { [weak self] result in
            guard let self = self else { return }
            
            guard let authDataResult = result else { return }
            
            let params = RegisterProfileAPIParams(id: authDataResult.user.uid,
                                                  email: emailString,
                                                  username: usernameString)
            
            self.api.registerProfile(params: params,
                                onSuccess: onCompletion,
                                onError: onAddProfileError)
        }
    }
}

// MARK: - Methods

extension RegistrationViewModel {
    func register(emailString: String,
                  usernameString: String,
                  passwordString: String,
                  onSuccess: @escaping VoidResult,
                  onError: @escaping ErrorResult) {
        let creds = UserCredentials(email: emailString,
                                    password: passwordString)
        
        register(withCredential: creds,
                 onSuccess: handleRegistrationSuccess(emailString: emailString,
                                                      usernameString: usernameString,
                                                      onCompletion: onSuccess,
                                                      onAddProfileError: onError),
                 onError: onError)
        
    }
}

extension RegistrationViewModel: FirebaseAuthenticatorManager {}
