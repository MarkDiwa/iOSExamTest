//
//  DashboardViewController.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 6/30/22.
//

import UIKit

class DashboardViewController: UITabBarController {
}

// MARK: - Lifecycle

extension DashboardViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup

private extension DashboardViewController {
    func setup() {
        setupViewControllers()
        setupTabBar()
        setupNavigationController()
    }
    
    func setupTabBar() {
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
    }
    
    
    func setupNavigationController() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add,
                                        target: self,
                                        action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func setupViewControllers() {
        let vc1 = ProfileViewController()
        vc1.viewModel = ProfileViewModel()
        vc1.tabBarItem = UITabBarItem(title: "Profile",
                                      image: UIImage(systemName: "person.fill"),
                                      selectedImage: nil)
        
        let vc2 = HomeViewController()
        vc2.viewModel = HomeViewModel()
        vc2.tabBarItem = UITabBarItem(title: "Home",
                                      image: UIImage(systemName: "house.fill"),
                                      selectedImage: nil)
        
        let vc3 = SettingsViewController()
        vc3.viewModel = SettingsViewModel()
        vc3.tabBarItem = UITabBarItem(title: "Settings",
                                      image: UIImage(systemName: "gearshape.fill"),
                                      selectedImage: nil)
        
        viewControllers = [vc1, vc2, vc3]
    }
}

// MARK: Actions

extension DashboardViewController {
    @objc
    func addButtonTapped() {
        pushAddPostViewController()
    }
}

// MARK: - Routers

private extension DashboardViewController {
    
    func pushAddPostViewController() {
        let vc = AddPostViewController()
        vc.viewModel = AddPostViewModel()
        navigationController?.pushViewController(vc, animated: true)
    }
}
