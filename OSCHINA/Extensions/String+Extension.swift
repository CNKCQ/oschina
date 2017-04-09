//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/9/3.
//

import Foundation

extension String {
    var URLEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    }
}

// MARK: - convert
extension String {
    func toFloat() -> Float? {
        let numberFormatter = NumberFormatter()
        return numberFormatter.number(from: self)?.floatValue
    }

    func toDouble() -> Double? {
        let numberFormatter = NumberFormatter()
        return numberFormatter.number(from: self)?.doubleValue
    }
}
