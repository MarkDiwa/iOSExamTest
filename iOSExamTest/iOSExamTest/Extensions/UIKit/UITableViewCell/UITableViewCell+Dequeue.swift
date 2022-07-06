//
//  UITableViewCell+Dequeue.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/6/22.
//

import UIKit

extension UITableViewCell {
  static var reuseIdentifier: String {
    String(describing: self)
  }
}
