//
//  HomeViewController.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 6/30/22.
//

import UIKit

class HomeViewController: UIViewController {
    var viewModel: HomeViewModelProtocol?
    var activityView: UIActivityIndicatorView?
    
    @IBOutlet var tableView: UITableView!
}

// MARK: - Lifecycle

extension HomeViewController {
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

private extension HomeViewController {
    func setup() {
        setupTableView()
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

private extension HomeViewController {
    func handleGetUserFeedsSuccess() -> VoidResult {
        return { [weak self] in
            guard let self = self else { return }
            
            self.hideActivityIndicator()
            self.tableView.reloadData()
        }
    }
}

// MARK: - Helpers

private extension HomeViewController {
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

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfItems ?? 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(PostItemTableViewCell.self)
        cell?.viewModel = viewModel?.generatePostItemCellVM(at: indexPath.row)
        
        return cell ?? UITableViewCell()
    }
    
    
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    // TODO: - Display Post Detail when tapped.
}
