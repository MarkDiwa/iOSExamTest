//
//  AddPostViewModelProtocol.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/5/22.
//

import Foundation

protocol AddPostViewModelProtocol {
    
    func addPost(content: String,
                 onSuccess: @escaping VoidResult,
                 onError: @escaping ErrorResult)
}
