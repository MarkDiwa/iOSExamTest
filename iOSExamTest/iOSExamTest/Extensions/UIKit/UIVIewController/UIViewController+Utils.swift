//
//  UIViewController+Utils.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 6/30/22.
//

import UIKit

extension UIViewController {
    func hideNavigationBar() {
        navigationController?.setNavigationBarHidden(true,
                                                     animated: false
        )
    }
}
