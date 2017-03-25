//
//  Copyright © 2016年 Jack. All rights reserved.
//  Created by KingCQ on 16/8/3.
//

import Foundation
import UIKit

// MARK: - Common UITableView text styling
extension NSAttributedString {
    static func tableRowTitle(_ string: String) -> NSAttributedString {
        return NSAttributedString(string: string, attributes: [NSForegroundColorAttributeName: UIColor.black])
    }

    static func disabledTableRowTitle(_ string: String) -> NSAttributedString {
        return NSAttributedString(string: string, attributes: [NSForegroundColorAttributeName: UIColor.white])
    }
}
