//
//  HomeViewModelProtocol.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/6/22.
//

import Foundation

protocol HomeViewModelProtocol {
    var numberOfItems: Int { get }
    
    func getUserFeeds(onSuccess: @escaping VoidResult, onError: @escaping ErrorResult)
    
    func generatePostItemCellVM(at index: Int) -> PostItemCellViewModelProtocol
}
