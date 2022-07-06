//
//  RegistrationViewController.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/5/22.
//

import UIKit
import SkyFloatingLabelTextField


class RegistrationViewController: UIViewController {
    var viewModel: RegistrationViewModelProtocol?
    var activityView: UIActivityIndicatorView?
    
    @IBOutlet var emailField: SkyFloatingLabelTextField!
    @IBOutlet var usernameField: SkyFloatingLabelTextField!
    @IBOutlet var passwordField: SkyFloatingLabelTextField!
    @IBOutlet var confirmPasswordField: SkyFloatingLabelTextField!
    
    private var inputValidity = UserInputValidity.valid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        registerUser()
    }
}

// MARK: - Event Handlers

private extension RegistrationViewController {
    func handleOnRegistrationSuccess() -> VoidResult {
        return { [weak self] in
            guard let self = self else { return }
            
            self.hideActivityIndicator()
            self.navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: - Helpers

private extension RegistrationViewController {
    
    var emailString: String { emailField.text ?? "" }
    var usernameString: String { usernameField.text ?? "" }
    var passwordString: String { passwordField.text ?? "" }
    var confirmPasswordString: String { confirmPasswordField.text ?? ""}
    
    func registerUser() {
        validateUserInput()
        refreshFields()
        
        guard inputValidity == .valid else {
            addErrorMessageToErrorFields()
            return
        }
        showActivityIndicator()
        viewModel?.register(emailString: emailString,
                            usernameString: usernameString,
                            passwordString: passwordString,
                            onSuccess: handleOnRegistrationSuccess(),
                            onError: handleError())
    }
    
    func validateUserInput() {
        inputValidity = .valid
        if emailString.isEmpty ||
            usernameString.isEmpty ||
            passwordString.isEmpty ||
            confirmPasswordString.isEmpty {
            inputValidity = .invalid
        }
        
        if passwordString != confirmPasswordString {
            inputValidity = .invalid
        }
    }
    
    func addErrorMessageToErrorFields() {
        if emailString.isEmpty {
            emailField.errorMessage = "Email Cannot Be Empty"
        }
        
        if usernameString.isEmpty {
            usernameField.errorMessage = "Username Cannot Be Empty"
        }
        
        if passwordString.isEmpty {
            passwordField.errorMessage = "Password Cannot Be Empty"
        }
        
        if confirmPasswordString.isEmpty {
            confirmPasswordField.errorMessage = "Confirm Password Cannot Be Empty"
        }
        
        if passwordString != confirmPasswordString {
            let errorMessage = "Entered Password Doesn't Match"
            
            passwordField.errorMessage = errorMessage
            confirmPasswordField.errorMessage = errorMessage
        }
    }
    
    func refreshFields() {
        emailField.errorMessage = nil
        usernameField.errorMessage = nil
        passwordField.errorMessage = nil
        confirmPasswordField.errorMessage = nil
    }
    
    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = view.center
        view.addSubview(activityView ?? UIActivityIndicatorView(style: .large))
        activityView?.startAnimating()
    }

    func hideActivityIndicator() {
        activityView?.stopAnimating()
    }
}

