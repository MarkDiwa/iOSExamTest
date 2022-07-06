//
//  UITableView+Dequeue.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/6/22.
//

import UIKit

extension UITableView {
  func register<T: UITableViewCell>(_ cell: T.Type) {
    register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
  }
  
  func registerWithNib<T: UITableViewCell>(_ cell: T.Type) {
    register(
      UINib(
        nibName: T.reuseIdentifier,
        bundle: nil
      ),
      forCellReuseIdentifier: T.reuseIdentifier
    )
  }

  func dequeueCell<T: UITableViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T? {
    dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T
  }
  
  func dequeueCell<T: UITableViewCell>(_ cell: T.Type) -> T? {
    dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T
  }
}

extension Decodable {
    static func decode(_ dictionary: [String: Any]) throws -> Self {
      return try JSONDecoder().decode(self, from: (try JSONSerialization.data(withJSONObject: dictionary)))
    }
}
