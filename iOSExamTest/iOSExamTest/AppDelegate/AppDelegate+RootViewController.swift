//
//  AppDelegate+RootViewController.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 6/30/22.
//

import FirebaseAuth
import UIKit

extension AppDelegate {
    func setupInitialViewController() {
        window = UIWindow()
        guard Auth.auth().currentUser != nil else {
            self.presentLoginViewController()
            return
        }
        
        self.presentDashboard()
    }
    
    @objc
    func presentLoginViewController() {
        let vc = LoginViewController()
        vc.viewModel = LoginViewModel()
        
        let navigationController = UINavigationController(rootViewController: vc)
        window?.setRootViewControllerAnimated(navigationController)
    }
    
    @objc
    func presentDashboard() {
        let vc = DashboardViewController()
        let nc = UINavigationController(rootViewController: vc)
        window?.setRootViewControllerAnimated(nc)
    }
}
