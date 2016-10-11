//
//  Copyright © 2016年 Jack. All rights reserved.
//  Created by KingCQ on 16/8/3.
//

import Foundation

extension NSBundle {
    static var releaseVersionNumber: String? {
        return NSBundle.mainBundle().infoDictionary?["CFBundleShortVersionString"] as? String
    }

    static var buildVersionNumber: String? {
        return NSBundle.mainBundle().infoDictionary?["CFBundleVersion"] as? String
    }
}
