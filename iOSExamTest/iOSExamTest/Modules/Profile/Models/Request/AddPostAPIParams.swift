//
//  AddPostAPIParams.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/5/22.
//

import Foundation

struct AddPostAPIParams: Codable {
    var content: String
    var userID: String
    var numberOfLikes: Int
}

struct JSON {
    static let encoder = JSONEncoder()
}

extension Encodable {
    var dictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: JSON.encoder.encode(self))) as? [String: Any] ?? [:]
    }
}
