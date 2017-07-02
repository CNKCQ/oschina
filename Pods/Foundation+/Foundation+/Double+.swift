//
//  Double+.swift
//  Elegant
//
//  Created by Steve on 2017/5/18.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import Foundation

public extension Double {

    ///  Returns a string representing the Double.
    var toString: String {
        return String(self)
    }

    /// Returns a absolute value of Double.
    var abs: Double {
        return self > 0 ? self : -self
    }
}
