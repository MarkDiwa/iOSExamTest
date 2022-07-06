//
//  PostItemTableViewCell.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/5/22.
//

import UIKit

class PostItemTableViewCell: UITableViewCell {
    var viewModel: PostItemCellViewModelProtocol? {
        didSet {
            refresh()
        }
    }
    
    var deleteButtonTapped: VoidResult?
    
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var numberOfLikesLabel: UILabel!
    @IBOutlet var deleteButton: UIButton!
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        deleteButtonTapped?()
    }
}

// MARK: - Refresh

private extension PostItemTableViewCell {
    func refresh() {
        guard let viewModel = viewModel else { return }
        
        usernameLabel.text = viewModel.usernameString
        contentLabel.text = viewModel.contentString
        numberOfLikesLabel.text = viewModel.numberOfLikesString
        deleteButton.isHidden = viewModel.isDeleteButtonHidden
    }
}
