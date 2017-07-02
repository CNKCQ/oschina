//
//  UINavigationController+.swift
//  Elegant
//
//  Created by Steve on 2017/5/22.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

// See: http://stackoverflow.com/questions/1214965/setting-action-for-back-button-in-navigation-controller/19132881#comment34452906_19132881
public protocol BackBarButtonItemDelegate: class {

    /// Ask if you want to pop
    ///
    /// - Returns: Bool value
    func shouldPopOnBackBarButtonItem() -> Bool
}

extension UINavigationController: UINavigationBarDelegate {

     public func navigationBar(_ navigationBar: UINavigationBar, shouldPop _: UINavigationItem) -> Bool {
        if viewControllers.count < navigationBar.items?.count ?? 2 {
            return true
        }
        var shouldPop = true
        if let viewController = topViewController as? BackBarButtonItemDelegate {
            shouldPop = viewController.shouldPopOnBackBarButtonItem()
        }
        if shouldPop {
            DispatchQueue.main.async {
                self.popViewController(animated: true)
            }
        } else {
            // Prevent the back button from staying in an disabled state
            for view in navigationBar.subviews {
                if view.alpha < 1 {
                    UIView.animate(withDuration: 0.25, animations: {
                        view.alpha = 1
                    })
                }
            }
        }
        return false
    }
}
