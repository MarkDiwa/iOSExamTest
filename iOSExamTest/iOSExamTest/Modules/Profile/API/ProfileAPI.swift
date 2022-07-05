//
//  ProfileAPI.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/5/22.
//

import Foundation

class ProfileAPI {
    let firebaseAPIHelper: FirebaseAPIHelper
    
    init(firebaseAPIHelper: FirebaseAPIHelper = FirebaseAPIHelper()) {
        self.firebaseAPIHelper = firebaseAPIHelper
    }
    
    func addPost(params: AddPostAPIParams,
                 onSuccess: @escaping VoidResult,
                 onError: @escaping ErrorResult
    ) {
        firebaseAPIHelper.addData(path: "posts",
                                  data: params.dictionary,
                                  onSuccess: onSuccess,
                                  onError: onError)
    }
    
}
