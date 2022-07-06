//
//  LoginViewController.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 6/30/22.
//

import UIKit

class LoginViewController: UIViewController {
    var viewModel: LoginViewModelProtocol?
    var activityView: UIActivityIndicatorView?
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
}

// MARK: - Lifecycle

extension LoginViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        hideNavigationBar()
    }
}

// MARK: - Setup

private extension LoginViewController {
    func setup() {
        title = "Login"
    }
}

// MARK: - Actions

extension LoginViewController {
    @IBAction func loginButtonTapped(_ sender: Any) {
        let emailString = emailTextField.text ?? ""
        let passwordString = passwordTextField.text ?? ""
        
        showActivityIndicator()
        viewModel?.login(withEmail: emailString,
                         password: passwordString,
                         onSuccess: handleLoginSuccess(),
                         onError: handleLoginError())
    }
    
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        pushRegistrationScreen()
    }
}

// MARK: Routers

private extension LoginViewController {
    func pushRegistrationScreen() {
        
        let vc = RegistrationViewController()
        vc.viewModel = RegistrationViewModel()
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: Event Handlers

private extension LoginViewController {
    func handleLoginSuccess() -> VoidResult {
        return { [weak self] in
            guard let self = self else { return }
            
            self.hideActivityIndicator()
        }
    }
    
    func handleLoginError() -> ErrorResult {
        return { [weak self] error in
            guard let self = self else { return }
            
            self.hideActivityIndicator()
        }
    }
}

// MARK: - Helpers

private extension LoginViewController {
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
