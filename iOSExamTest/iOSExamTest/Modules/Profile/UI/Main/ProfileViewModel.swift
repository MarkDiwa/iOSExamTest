//
//  ProfileViewModel.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/6/22.
//

import Foundation
import FirebaseFirestore

class ProfileViewModel: ProfileViewModelProtocol {
    private var userFeeds: [Post] = []
    
    private let api: ProfileAPI
    
    init(api: ProfileAPI = ProfileAPI()) {
        self.api = api
    }
}

// MARK: - Event Handlers

private extension ProfileViewModel {
    func handleGetUserFeedsSuccess(onCompletion: @escaping VoidResult) -> SingleResult<QuerySnapshot> {
        return { [weak self] snapshot in
            guard let self = self else { return }
            let userID = App.shared.user?.id
            
            for document in snapshot.documents {
                let data = document.data()
                
                guard var post = try? Post.decode(data),
                      userID == post.userID else { continue }
                
                post.firebaseID = document.documentID
                self.userFeeds.append(post)
            }
            
            onCompletion()
        }
    }
}

// MARK: - Methods

extension ProfileViewModel {
    func deleteUserPost(at index: Int,
                        onSuccess: @escaping VoidResult,
                        onError: @escaping ErrorResult) {
        guard let id = userFeeds[index].firebaseID else { return }
        
        api.deletePostWith(id: id, onSuccess: onSuccess, onError: onError)
    }
    
    func getUserFeeds(onSuccess: @escaping VoidResult,
                      onError: @escaping ErrorResult) {
        userFeeds.removeAll()
        api.getUserFeeds(onSuccess: handleGetUserFeedsSuccess(onCompletion: onSuccess),
                         onError: onError)
    }
    
    func generatePostItemCellVM(at index: Int) -> PostItemCellViewModelProtocol {
        PostItemCellViewModel(post: userFeeds[index], isDeleteButtonHidden: false)
    }
}

// MARK: - Getters

extension ProfileViewModel {
    var numberOfItems: Int { userFeeds.count }
    var usernameString: String { "Hi @\(App.shared.user?.username ?? "")!" }
}
