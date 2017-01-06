//
//  Copyright © 2016年 Jack. All rights reserved.
//  Created by KingCQ on 16/8/2.
//

import UIKit

extension UILabel {
    
    public func size(_ string: String, width: Double) -> CGSize {
        return NSString(string: string).boundingRect(with: CGSize(width: width, height: DBL_MAX),
                                                             options: .usesLineFragmentOrigin,
                                                             attributes: [NSFontAttributeName: font],
                                                             context: nil).size
    }
    
    public func size(_ string: String) -> CGSize {
        return size(string, width: DBL_MAX)
    }
    
    public func setText(_ text: String?, fit: Bool = true) -> CGRect {
        self.text = text
        if fit {
            sizeToFit()
        }
        return frame
    }
    
    func setattributedText(_ text: NSAttributedString, fit: Bool = true) -> CGSize {
        attributedText = text
        if fit {
            sizeToFit()
        }
        return frame.size
    }
}
