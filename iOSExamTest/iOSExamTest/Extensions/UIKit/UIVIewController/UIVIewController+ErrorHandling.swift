//
//  UIVIewController+ErrorHandling.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 6/30/22.
//

import UIKit

extension UIViewController {
    func handleError() -> ErrorResult {
        return { error in
            print("ERROR: \(error)")
        }
    }
}
