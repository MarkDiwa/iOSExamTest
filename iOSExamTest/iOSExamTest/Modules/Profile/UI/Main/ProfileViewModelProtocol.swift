//
//  ProfileViewModelProtocol.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/6/22.
//

import Foundation

protocol ProfileViewModelProtocol {
    var numberOfItems: Int { get }
    var usernameString: String { get }
    
    func deleteUserPost(at index: Int, onSuccess: @escaping VoidResult, onError: @escaping ErrorResult)
    func getUserFeeds(onSuccess: @escaping VoidResult, onError: @escaping ErrorResult)
    
    func generatePostItemCellVM(at index: Int) -> PostItemCellViewModelProtocol
}
