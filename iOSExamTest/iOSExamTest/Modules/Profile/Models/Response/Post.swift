//
//  Post.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/3/22.
//

import Foundation

struct Post: Codable {
    var content: String
    var userID: String
    var username: String
    var userEmail: String
    var numberOfLikes: Int
    var firebaseID: String?
}
