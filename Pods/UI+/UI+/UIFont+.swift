//
//  UIFont+.swift
//  Elegant
//
//  Created by Steve on 2017/5/22.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit


// MARK: - convenience initializer declaration
public extension UIFont {

    convenience init?(_ size: CGFloat) {
        self.init(name: "HelveticaNeue", size: size)
    }
}

// MARK: -  System fonts
public extension UIFont {

    class var labelFont: UIFont {
        return systemFont(ofSize: labelFontSize)
    }

    class var buttonFont: UIFont {
        return systemFont(ofSize: buttonFontSize)
    }

    class var smallSystemFont: UIFont {
        return systemFont(ofSize: smallSystemFontSize)
    }

    class var systemFont: UIFont {
        return systemFont(ofSize: systemFontSize)
    }
}

extension UIFont {

    /// Returns a bolded version of `self`.
    var bolded: UIFont {
        return fontDescriptor.withSymbolicTraits(.traitBold)
            .map { UIFont(descriptor: $0, size: 0.0) } ?? self
    }

    /// Returns a italicized version of `self`.
    var italicized: UIFont {
        return fontDescriptor.withSymbolicTraits(.traitItalic)
            .map { UIFont(descriptor: $0, size: 0.0) } ?? self
    }
}
