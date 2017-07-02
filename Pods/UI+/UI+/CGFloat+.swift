//
//  CGFloat.swift
//  Elegant
//
//  Created by Steve on 2017/5/22.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

public extension CGFloat {

    /// The least positive normal number.
    static var min: CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}
