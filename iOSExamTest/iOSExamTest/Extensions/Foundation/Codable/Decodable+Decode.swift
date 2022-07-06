//
//  Decodable+Decode.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/6/22.
//

import Foundation

extension Decodable {
    static func decode(_ dictionary: [String: Any]) throws -> Self {
      return try JSONDecoder().decode(self, from: (try JSONSerialization.data(withJSONObject: dictionary)))
    }
}
