//
//  HomeViewModel.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/6/22.
//

import FirebaseFirestore
import Foundation

class HomeViewModel: HomeViewModelProtocol {
    private var userFeeds: [Post] = []
    
    private let api: ProfileAPI
    
    init(api: ProfileAPI = ProfileAPI()) {
        self.api = api
    }
}

// MARK: - Event Handlers

private extension HomeViewModel {
    func handleGetUserFeedsSuccess(onCompletion: @escaping VoidResult) -> SingleResult<QuerySnapshot> {
        return { [weak self] snapshot in
            guard let self = self else { return }
            
            for document in snapshot.documents {
                let data = document.data()
                
                guard var post = try? Post.decode(data) else { return }
                
                post.firebaseID = document.documentID
                self.userFeeds.append(post)
            }
            
            onCompletion()
        }
    }
}

// MARK: - Methods

extension HomeViewModel {
    func getUserFeeds(onSuccess: @escaping VoidResult,
                      onError: @escaping ErrorResult) {
        userFeeds.removeAll()
        api.getUserFeeds(onSuccess: handleGetUserFeedsSuccess(onCompletion: onSuccess),
                         onError: onError)
    }
    
    func generatePostItemCellVM(at index: Int) -> PostItemCellViewModelProtocol {
        PostItemCellViewModel(post: userFeeds[index], isDeleteButtonHidden: true)
    }
}

// MARK: - Getters

extension HomeViewModel {
    var numberOfItems: Int { userFeeds.count }
}
