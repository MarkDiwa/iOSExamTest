//
//  SettingsViewController.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 6/30/22.
//

import UIKit

class SettingsViewController: UIViewController {
    var viewModel: SettingsViewModelProtocol?
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        viewModel?.logout()
    }
}
