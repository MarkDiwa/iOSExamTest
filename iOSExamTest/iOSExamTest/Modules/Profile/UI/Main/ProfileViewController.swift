//
//  ProfileViewController.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 6/30/22.
//

import UIKit

class ProfileViewController: UIViewController {
    var activityView: UIActivityIndicatorView?
    var viewModel: ProfileViewModelProtocol?
    
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var tableView: UITableView!
}

// MARK: - Lifecycle

extension ProfileViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getData()
    }
}


// MARK: - Setup

private extension ProfileViewController {
    func setup() {
        setupTableView()
        setupLabel()
    }
    
    func setupLabel() {
        usernameLabel.text = viewModel?.usernameString
    }
    
    func setupTableView() {
        registerCells()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func registerCells() {
        tableView.registerWithNib(PostItemTableViewCell.self)
    }
}

// MARK: - Event Handlers

private extension ProfileViewController {
    func handleGetUserFeedsSuccess() -> VoidResult {
        return { [weak self] in
            guard let self = self else { return }
            
            self.hideActivityIndicator()
            self.tableView.reloadData()
        }
    }
    
    func handleDeleteUserPostSuccess() -> VoidResult {
        return { [weak self] in
            guard let self = self else { return }
            
            self.getData()
        }
    }
    
    func handleDeleteButtonTapped(at index: Int) -> VoidResult {
        return { [weak self] in
            guard let self = self else { return }
            
            let alert = UIAlertController(title: "Delete Post",
                                          message: "Are you sure you want to delete this post?",
                                          preferredStyle: .alert)
            
            let yesAlertAction = UIAlertAction(title: "Yes",
                                               style: .destructive,
                                               handler: { _ in
                
                self.viewModel?.deleteUserPost(at: index,
                                               onSuccess: self.handleDeleteUserPostSuccess(),
                                               onError: self.handleError())
            })
            let noAlertAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
            
            alert.addAction(yesAlertAction)
            alert.addAction(noAlertAction)
            self.present(alert, animated: true, completion: nil)
            
            
        }
    }
}

// MARK: - Helpers

private extension ProfileViewController {
    func getData() {
        showActivityIndicator()
        viewModel?.getUserFeeds(onSuccess: handleGetUserFeedsSuccess(),
                                onError: handleError())
    }
    
    func showActivityIndicator() {
        // TODO: Create a superclass for loading view
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = view.center
        view.addSubview(activityView ?? UIActivityIndicatorView(style: .large))
        activityView?.startAnimating()
    }
    
    func hideActivityIndicator() {
        activityView?.stopAnimating()
    }
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfItems ?? 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(PostItemTableViewCell.self)
        cell?.viewModel = viewModel?.generatePostItemCellVM(at: indexPath.row)
        cell?.deleteButtonTapped = handleDeleteButtonTapped(at: indexPath.row)
        
        return cell ?? UITableViewCell()
    }
    
    
}

// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    // TODO: - Display Post Detail when tapped.
}

