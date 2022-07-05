//
//  AddPostViewModel.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/5/22.
//

import Foundation

class AddPostViewModel: AddPostViewModelProtocol {
    let api: ProfileAPI
    
    init(api: ProfileAPI = ProfileAPI()) {
        self.api = api
    }
}

// MARK: - Methods

extension AddPostViewModel {
    func addPost(content: String,
                 onSuccess: @escaping VoidResult,
                 onError: @escaping ErrorResult) {
        guard let user = App.shared.user else { return }
        let params = AddPostAPIParams(content: content,
                                      userID: user.id,
                                      numberOfLikes: 0)
        
        api.addPost(params: params,
                    onSuccess: onSuccess,
                    onError: onError)
    }
}
