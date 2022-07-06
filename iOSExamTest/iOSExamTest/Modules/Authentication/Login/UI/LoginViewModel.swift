//
//  LoginViewModel.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 6/30/22.
//

import FirebaseFirestore
import Foundation
import FirebaseAuth

class LoginViewModel: LoginViewModelProtocol {
    let api: ProfileAPI
    
    init(api: ProfileAPI = ProfileAPI()) {
        self.api = api
    }
}

// MARK: - Event Handlers

private extension LoginViewModel {
    func handleLoginSuccess(onCompletion: VoidResult?,
                            onErrorGetData: @escaping ErrorResult) -> SingleResult<AuthDataResult?> {
        return { [weak self] authResult in
            guard
                let self = self,
                let authResult = authResult
            else { return }
            
            self
                .api
                .getUserData(onSuccess: self.handleGetUserDataSuccess(onCompletion: onCompletion,
                                                                      authResult: authResult),
                             onError: onErrorGetData)
        }
    }
    
    func handleGetUserDataSuccess(onCompletion: VoidResult?,
                                  authResult: AuthDataResult) -> SingleResult<QuerySnapshot> {
        return { snapshot in
            for document in snapshot.documents {
                let data = document.data()
                
                guard
                    let userID = data["id"] as? String,
                    userID == authResult.user.uid
                else { return }
                
                App.shared.user = User(id: userID,
                                       username: (data["username"] as? String)  ?? "",
                                       email: authResult.user.email ?? "")
                
                
                NotificationCenter
                    .default
                    .post(name: .userDidLogin,
                          object: self)
                
                onCompletion?()
                
            }
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
              onSuccess: handleLoginSuccess(onCompletion: onSuccess,
                                            onErrorGetData: onError),
              onError: onError)
    }
}

// MARK: - FirebaseAuthenticatorManager

extension LoginViewModel: FirebaseAuthenticatorManager {}
