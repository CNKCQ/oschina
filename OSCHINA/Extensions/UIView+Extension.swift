//
//  Copyright © 2016年 Jack. All rights reserved.
//  Created by KingCQ on 16/8/3.
//

import UIKit

extension UIView {

    class var reusableId: String {
        return String(self)
    }

    func addAction(target: AnyObject?, action: Selector) {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        userInteractionEnabled = true
        addGestureRecognizer(tapGesture)
    }
}
