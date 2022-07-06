//
//  ProfileAPI.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/5/22.
//

import FirebaseFirestore
import Foundation

class ProfileAPI {
    private let firebaseAPIHelper: FirebaseAPIHelper
    private let postPathString = "posts"
    private let userPathString = "users"
    
    init(firebaseAPIHelper: FirebaseAPIHelper = FirebaseAPIHelper()) {
        self.firebaseAPIHelper = firebaseAPIHelper
    }
    
    func addPost(params: AddPostAPIParams,
                 onSuccess: @escaping VoidResult,
                 onError: @escaping ErrorResult
    ) {
        firebaseAPIHelper.addData(path: postPathString,
                                  data: params.dictionary,
                                  onSuccess: onSuccess,
                                  onError: onError)
    }
    
    func deletePostWith(id: String,
                        onSuccess: @escaping VoidResult,
                        onError: @escaping ErrorResult) {
        firebaseAPIHelper.deleteData(collection: postPathString,
                                     path: id,
                                     onSuccess: onSuccess,
                                     onError: onError)
    }
    
    func getUserData(onSuccess: @escaping SingleResult<QuerySnapshot>,
                     onError: @escaping ErrorResult) {
        firebaseAPIHelper.getData(path: userPathString,
                                  onSuccess: onSuccess,
                                  onError: onError)
    }
    
    func getUserFeeds(onSuccess: @escaping SingleResult<QuerySnapshot>,
                      onError: @escaping ErrorResult) {
        firebaseAPIHelper.getData(path: postPathString,
                                  onSuccess: onSuccess,
                                  onError: onError)
    }
    
    func registerProfile(params: RegisterProfileAPIParams,
                         onSuccess: @escaping VoidResult,
                         onError: @escaping ErrorResult) {
        firebaseAPIHelper.addData(path: userPathString,
                                  data: params.dictionary,
                                  onSuccess: onSuccess,
                                  onError: onError)
    }
    
}
