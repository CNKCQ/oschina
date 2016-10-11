//
//  Copyright © 2016年 Jack. All rights reserved.
//  Created by KingCQ on 16/8/2.
//

import UIKit

extension UILabel {
    
    public func size(string: String, width: Double) -> CGSize {
        return NSString(string: string).boundingRectWithSize(CGSize(width: width, height: DBL_MAX),
                                                             options: .UsesLineFragmentOrigin,
                                                             attributes: [NSFontAttributeName: font],
                                                             context: nil).size
    }
    
    public func size(string: String) -> CGSize {
        return size(string, width: DBL_MAX)
    }
    
    public func setText(text: String?, fit: Bool = true) -> CGRect {
        self.text = text
        if fit {
            sizeToFit()
        }
        return frame
    }
    
    func setattributedText(text: NSAttributedString, fit: Bool = true) -> CGSize {
        attributedText = text
        if fit {
            sizeToFit()
        }
        return frame.size
    }
}
