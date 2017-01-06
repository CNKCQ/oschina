//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/8/12.
//

import UIKit

public protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

public protocol NibReusable: Reusable, NibLoadable {}

public extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
