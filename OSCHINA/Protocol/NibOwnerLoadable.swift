/*********************************************
 *
 * This code is under the MIT License (MIT)
 *
 * Copyright (c) 2016 AliSoftware
 *
 *********************************************/

import UIKit

public protocol NibOwnerLoadable: class {
  static var nib: UINib { get }
}

public extension NibOwnerLoadable {
  static var nib: UINib {
    return UINib(nibName: String(self), bundle: NSBundle(forClass: self))
  }
}

public extension NibOwnerLoadable where Self: UIView {
  static func loadFromNib() -> Self {
    let owner = Self()
    let layoutAttributes: [NSLayoutAttribute] = [.Top, .Leading, .Bottom, .Trailing]

    for view in nib.instantiateWithOwner(owner, options: nil) {
      if let view = view as? UIView {
        view.translatesAutoresizingMaskIntoConstraints = false
        owner.addSubview(view)
        layoutAttributes.forEach { attribute in
          owner.addConstraint(NSLayoutConstraint(item: view,
            attribute: attribute,
            relatedBy: .Equal,
            toItem: owner,
            attribute: attribute,
            multiplier: 1,
            constant: 0.0))
        }
      }
    }
    return owner
  }
}
