//
//  LoginViewController.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 6/30/22.
//

import UIKit

class LoginViewController: UIViewController {
    var viewModel: LoginViewModelProtocol?
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
}

// MARK: - Lifecycle

extension LoginViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

// MARK: - Setup

private extension LoginViewController {
    func setup() {
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        hideNavigationBar()
    }
}

// MARK: - Actions

extension LoginViewController {
    @IBAction func loginButtonTapped(_ sender: Any) {
        let emailString = emailTextField.text ?? ""
        let passwordString = passwordTextField.text ?? ""
        
        viewModel?.login(withEmail: emailString,
                         password: passwordString,
                         onSuccess: handleLoginSuccess(),
                         onError: handleError())
    }
    
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let emailString = emailTextField.text ?? ""
        let passwordString = passwordTextField.text ?? ""
        
        viewModel?.register(withEmail: emailString,
                            password: passwordString,
                            onSuccess: handleRegisterSuccess(),
                            onError: handleError())
    }
}

// MARK: Event Handlers

private extension LoginViewController {
    func handleLoginSuccess() -> VoidResult {
        return {
            print("Login Success")
        }
    }
    
    func handleRegisterSuccess() -> VoidResult {
        return {
            print("Register Success")
        }
    }
}
