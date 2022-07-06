//
//  PostItemCellViewModel.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/5/22.
//

import Foundation

class PostItemCellViewModel: PostItemCellViewModelProtocol {
    var isDeleteButtonHidden: Bool
    
    private let post: Post
    
    init(post: Post,
         isDeleteButtonHidden: Bool) {
        self.post = post
        self.isDeleteButtonHidden = isDeleteButtonHidden
    }
}

// MARK: - PostItemCellViewModel

extension PostItemCellViewModel {
    var usernameString: String { "@\(post.username)" }
    var contentString: String { post.content }
    var numberOfLikesString: String { "\(post.numberOfLikes) Likes" }
}
