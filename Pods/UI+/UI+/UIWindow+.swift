//
//  UIWindow+.swift
//  Elegant
//
//  Created by Steve on 2017/5/22.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

public extension UIWindow {

    /// See: http://stackoverflow.com/questions/24825123/get-the-current-view-controller-from-the-app-delegate
    static var visibleViewController: UIViewController {
        func findBestViewController(_ controller: UIViewController?) -> UIViewController? {
            if let presented = controller?.presentedViewController {
                return findBestViewController(presented)
            } else {
                switch controller {
                case is UISplitViewController: // Return right hand side
                    let split = controller as? UISplitViewController
                    guard split?.viewControllers.isEmpty ?? true else {
                        return findBestViewController(split?.viewControllers.last)
                    }
                case is UINavigationController: // Return top view
                    let navigation = controller as? UINavigationController
                    guard navigation?.viewControllers.isEmpty ?? true else {
                        return findBestViewController(navigation?.topViewController)
                    }
                case is UITabBarController: // Return visible view
                    let tab = controller as? UITabBarController
                    guard tab?.viewControllers?.isEmpty ?? true else {
                        return findBestViewController(tab?.selectedViewController)
                    }
                default: break
                }
            }
            return controller
        }
        guard let visibleController = findBestViewController(UIApplication.shared.keyWindow?.rootViewController) else {
            fatalError("Haven't found the rootViewController")
        }
        return visibleController
    }
}
