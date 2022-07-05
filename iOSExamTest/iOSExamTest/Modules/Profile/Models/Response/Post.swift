//
//  Post.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/3/22.
//

import Foundation

struct Post {
    var id: String
    var posterID: String
    var content: String
    var comments: [Post]
    var numberOfLikes: Int
}
