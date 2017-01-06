/*********************************************
 *
 * This code is under the MIT License (MIT)
 *
 * Copyright (c) 2016 AliSoftware
 *
 *********************************************/

import UIKit

// MARK: Protocol Definition
public protocol StoryboardBased: class {
  /// The UIStoryboard to use when we want to instantiate this ViewController
  static var storyboard: UIStoryboard { get }
}


// MARK: Default Implementation

public extension StoryboardBased {
  /// By default, use the storybaord with the same name as the class
  static var storyboard: UIStoryboard {
    return UIStoryboard(name: String(describing: self), bundle: Bundle(for: self))
  }
}

// MARK: Support for instantiation from Storyboard

public extension StoryboardBased where Self: UIViewController {
  static func instantiate() -> Self {
    guard let vc = storyboard.instantiateInitialViewController() as? Self else {
      fatalError("The initialViewController of '\(storyboard)' is not of class '\(self)'")
    }
    return vc
  }
}
