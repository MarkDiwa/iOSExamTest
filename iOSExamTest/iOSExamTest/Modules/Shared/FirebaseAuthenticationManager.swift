//
//  FirebaseAuthenticationManager.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 6/30/22.
//

import Foundation
import FirebaseAuth

protocol FirebaseAuthenticatorManager {}

extension FirebaseAuthenticatorManager {
    
    func login(withCredential creds: UserCredentials,
               onSuccess: @escaping SingleResult<AuthDataResult?>,
               onError: @escaping ErrorResult) {
        Auth.auth().signIn(withEmail: creds.email,
                           password: creds.password) { authResult, error in
            if let error = error {
                onError(error)
                return
            }
            
            onSuccess(authResult)
        }
    }
    
    func register(withCredential creds: UserCredentials,
                  onSuccess: @escaping SingleResult<AuthDataResult?>,
                  onError: @escaping ErrorResult) {
        Auth.auth().createUser(withEmail: creds.email,
                               password: creds.password) { authResult, error in
            if let error = error {
                onError(error)
                return
            }
            
            onSuccess(authResult)
        }
    }
}
