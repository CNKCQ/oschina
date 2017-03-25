//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/8/12.
//

import UIKit

public protocol Reusable: class {

    associatedtype reusableType = Self

    static var reuseIdentifier: String { get }
}

public extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

class Test {
    func test<T: Reusable>() -> T where T == T.reusableType {
        return ok() as! T
    }
}

class ok: Reusable {
}
