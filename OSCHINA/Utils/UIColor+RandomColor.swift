//
//  UIColor+RandomColor.swift
//  Swiftk
//
//  Created by Jack on 16/4/17.
//  Copyright © 2016年 Jack. All rights reserved.
//

import UIKit

extension UIColor{
    
    /** 16进制颜色 */
    public class func colorWithHex(_ hexColor: Int, alpha: CGFloat = 1) -> UIColor {
        return UIColor(
            red: CGFloat((hexColor & 0xFF0000) >> 16) / 255,
            green: CGFloat((hexColor & 0xFF00) >> 8) / 255,
            blue: CGFloat(hexColor & 0xFF) / 255,
            alpha: alpha
        )
    }
    
    class func randomColor() -> UIColor {
        return UIColor(red: randomNumber(), green: randomNumber(), blue: randomNumber(), alpha: 1.0)
    }
    
    class func randomNumber() -> CGFloat {
        return CGFloat(arc4random_uniform(256)) / CGFloat(255)
    }
}
