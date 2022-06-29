//
//  UIWindow+RootController.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 6/30/22.
//

import UIKit

extension UIWindow {
    func setRootViewControllerAnimated(_ controller: UIViewController?,
                                       duration: TimeInterval = 0.25,
                                       options: UIView.AnimationOptions = .transitionCrossDissolve,
                                       completion: ((_ finished: Bool) -> Void)? = nil) {
        UIView.transition(with: self,
                          duration: duration,
                          options: options,
                          animations: { [weak self] in
            guard let self = self else { return }
            
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            self.rootViewController = controller
            UIView.setAnimationsEnabled(oldState)
        }, completion: completion)
    }
}
