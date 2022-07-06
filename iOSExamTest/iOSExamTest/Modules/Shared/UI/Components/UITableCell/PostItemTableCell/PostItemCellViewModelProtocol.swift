//
//  PostItemCellViewModelProtocol.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/5/22.
//

import Foundation

protocol PostItemCellViewModelProtocol {
    var usernameString: String { get }
    var contentString: String { get }
    var numberOfLikesString: String { get }
    var isDeleteButtonHidden: Bool { get }
}
