//
//  UserDefaults+.swift
//  Elegant
//
//  Created by Steve on 2017/5/22.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import Foundation

public extension UserDefaults {

    /// Accesses the value associated with the given key for reading and writing.
    ///
    /// - Parameter key: The position of the element to access.
    subscript(_ key: String) -> Any? {
        get {
            return object(forKey: key)
        }
        set {
            set(newValue, forKey: key)
        }
    }
}
