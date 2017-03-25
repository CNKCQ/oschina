//
//  String+CacheMenu.swift
//  Swiftk
//
//  Created by Jack on 16/4/17.
//  Copyright © 2016年 Jack. All rights reserved.
//

import UIKit

extension String {
    /**
     将当前字符串拼接到cache目录后面
     */
    func cacheDir() -> String {
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString
        return path.appendingPathComponent((self as NSString).lastPathComponent)
    }

    /**
     将当前字符串拼接到doc目录后面
     */
    func docDir() -> String {
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString
        return path.appendingPathComponent((self as NSString).lastPathComponent)
    }

    /**
     将当前字符串拼接到tmp目录后面
     */
    func tmpDir() -> String {
        let path = NSTemporaryDirectory() as NSString
        return path.appendingPathComponent((self as NSString).lastPathComponent)
    }
}
