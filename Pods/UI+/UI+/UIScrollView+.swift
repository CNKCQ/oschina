//
//  UIScrollView+.swift
//  Elegant
//
//  Created by Steve on 2017/5/24.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

public extension UIScrollView {

    /// `set` `get` the content's height
    var contentHeight: CGFloat {
        get {
            return contentSize.height
        } set {
            contentSize = CGSize(width: contentSize.width, height: newValue)
        }
    }

    /// `set` `get` the content's width
    var contentWidth: CGFloat {
        get {
            return contentSize.height
        } set {
            contentSize = CGSize(width: newValue, height: contentSize.height)
        }
    }

    /// `set` `get` the content's offsetX
    var offsetX: CGFloat {
        get {
            return contentOffset.x
        } set {
            contentOffset = CGPoint(x: newValue, y: contentOffset.y)
        }
    }

    /// `set` `get` the content's offsetY
    var offsetY: CGFloat {
        get {
            return contentOffset.y
        } set {
            contentOffset = CGPoint(x: contentOffset.x, y: newValue)
        }
    }
}
