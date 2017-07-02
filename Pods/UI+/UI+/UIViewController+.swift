//
//  UIViewController.swift
//  Elegant
//
//  Created by Steve on 2017/5/22.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

public extension UIViewController {

    /// Uses a horizontal slide transition. Has no effect if the view controller is already in the stack.
    func push(_ viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }

    /// Returns the popped controller.
    @discardableResult
    func pop(_ animated: Bool = true) -> UIViewController? {
        return navigationController?.popViewController(animated: animated)
    }

    /// Pops view controllers until the one specified is on top. Returns the popped controllers.
    @discardableResult
    func pop(to viewController: UIViewController, animated: Bool = true) -> [UIViewController]? {
        return navigationController?.popToViewController(viewController, animated: animated)
    }
}
