//
//  UIScreen+.swift
//  Elegant
//
//  Created by Steve on 2017/5/24.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

public extension UIScreen {

    /// Returns screen's width
    static var width: CGFloat {
        return UIScreen.main.bounds.width
    }

    /// Returns screen's height
    static var height: CGFloat {
        return UIScreen.main.bounds.height
    }

    /// Returns statusBar's height
    static var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }
}
