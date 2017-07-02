//
//  Float+.swift
//  Elegant
//
//  Created by Steve on 2017/5/24.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import Foundation

// MARK: - Making property to get when -math or similar is specified.
extension Float {

    var sqrt: Float {
        return sqrtf(self)
    }

    var abs: Float {
        return fabsf(self)
    }

    var floor: Float {
        return floorf(self)
    }

    var ceil: Float {
        return ceilf(self)
    }

    var round: Float {
        return roundf(self)
    }
}

public func min(_ one: Float, _ other: Float) -> Float {
    return fminf(one, other)
}

public func max(_ one: Float, _ other: Float) -> Float {
    return fmaxf(one, other)
}

public func random(min: Float = 0, max: Float) -> Float {
    let diff = max - min
    let rand = Float(arc4random() % (UInt32(RAND_MAX) + 1))
    return ((rand / Float(RAND_MAX)) * diff) + min
}
