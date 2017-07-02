//
//  Sequence+.swift
//  Elegant
//
//  Created by Steve on 2017/6/26.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import Foundation

public extension Sequence where Iterator.Element: Hashable {

    /// Returns an unique sequence
    var unique: [Iterator.Element] {
        var temp: [Iterator.Element: Bool] = [:]
        return self.filter { temp.updateValue(true, forKey: $0) == nil }
    }
}
