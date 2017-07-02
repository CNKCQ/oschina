//
//  UIColor+.swift
//  Elegant
//
//  Created by Steve on 2017/5/22.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

public extension UIColor {

    /// Returns random UIColor with random alpha(default: 1.0)
    static var random: UIColor {
        return UIColor(
            red: CGFloat(arc4random_uniform(256)) / CGFloat(255),
            green: CGFloat(arc4random_uniform(256)) / CGFloat(255),
            blue: CGFloat(arc4random_uniform(256)) / CGFloat(255),
            alpha: 1.0
        )
    }
}

public extension UIColor {

    /// See: https://developer.apple.com/ios/human-interface-guidelines/visual-design/color/
    static var iOSRed: UIColor {
        return UIColor(0xFF3B30)
    }

    static var iOSOrange: UIColor {
        return UIColor(0xFF9500)
    }

    static var iOSYellow: UIColor {
        return UIColor(0xFFCC00)
    }

    static var iOSGreen: UIColor {
        return UIColor(0x4CD964)
    }

    static var iOSTealBlue: UIColor {
        return UIColor(0x5AC8FA)
    }

    static var iOSBlue: UIColor {
        return UIColor(0x007AFF)
    }

    static var iOSPurple: UIColor {
        return UIColor(0x5856D6)
    }

    static var iOSPink: UIColor {
        return UIColor(0xFF2D55)
    }

    /// init method with hex Int and alpha(default: 1)
    ///
    /// - Parameters:
    ///   - hex: The hex
    ///   - alpha: The alpha
    convenience init(_ hex: Int, alpha: CGFloat = 1) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255,
            green: CGFloat((hex & 0xFF00) >> 8) / 255,
            blue: CGFloat(hex & 0xFF) / 255,
            alpha: alpha
        )
    }

    /// init method with hex string and alpha(default: 1)
    ///
    /// - Parameters:
    ///   - hex: The hex
    ///   - alpha: The alpha
    convenience init?(hexString: String, alpha: CGFloat = 1) {
        let intString = hexString.replacingOccurrences(of: "#", with: "")
        guard let hex = Int(intString, radix: 16) else {
            return nil
        }
        self.init(hex, alpha: alpha)
    }
}
