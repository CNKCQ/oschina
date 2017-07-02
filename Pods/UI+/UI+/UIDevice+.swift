//
//  UIDevice+.swift
//  Elegant
//
//  Created by Steve on 2017/5/22.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

public extension UIDevice {

    /// Returns identifierForVendor's uuid
    static var idForVendor: String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }

    /// Returns true if the device is iPhone
    static var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }

    /// Returns true if the device is iPad
    static var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }
}
