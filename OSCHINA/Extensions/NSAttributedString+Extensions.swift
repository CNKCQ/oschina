//
//  Copyright © 2016年 Jack. All rights reserved.
//  Created by KingCQ on 16/8/3.
//


import Foundation
import UIKit

// MARK: - Common UITableView text styling
extension NSAttributedString {
    static func tableRowTitle(string: String) -> NSAttributedString {
        return NSAttributedString(string: string, attributes: [NSForegroundColorAttributeName: UIColor.blackColor()])
    }
    
    static func disabledTableRowTitle(string: String) -> NSAttributedString {
        return NSAttributedString(string: string, attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
    }
}