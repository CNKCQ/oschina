//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/9/3.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

extension ValidationResult: CustomStringConvertible {
    var description: String {
        switch self {
        case let .ok(message):
            return message
        case .empty:
            return "内容为空"
        case .validating:
            return "validating ..."
        case let .failed(message):
            return message
        }
    }
}

struct ValidationColors {
    static let okColor = UIColor(red: 138.0 / 255.0, green: 221.0 / 255.0, blue: 109.0 / 255.0, alpha: 1.0)
    static let errorColor = UIColor.red
}

extension ValidationResult {
    var textColor: UIColor {
        switch self {
        case .ok:
            return ValidationColors.okColor
        case .empty:
            return UIColor.red
        case .validating:
            return UIColor.brown
        case .failed:
            return ValidationColors.errorColor
        }
    }
}

extension UILabel {
    var ex_validationResult: AnyObserver<ValidationResult> {
        return UIBindingObserver(UIElement: self) { label, result in
            label.textColor = result.textColor
            label.text = result.description
            }.asObserver()
    }
}
