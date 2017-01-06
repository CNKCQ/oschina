/*********************************************
 *
 * This code is under the MIT License (MIT)
 *
 * Copyright (c) 2016 AliSoftware
 *
 *********************************************/

import UIKit

// MARK: Protocol Definition
public protocol StoryboardSceneBased: class {
  /// The UIStoryboard to use when we want to instantiate this ViewController
  static var storyboard: UIStoryboard { get }
  /// The scene identifier to use when we want to instantiate this ViewController from its associated Storyboard
  static var sceneIdentifier: String { get }
}

// MARK: Default Implementation
public extension StoryboardSceneBased {
  /// By default, use the `sceneIdentifier` with the same name as the class
  static var sceneIdentifier: String {
    return String(describing: self)
  }
}

// MARK: Support for instantiation from Storyboard
public extension StoryboardSceneBased where Self: UIViewController {
  static func instantiate() -> Self {
    guard let vc = storyboard.instantiateViewController(withIdentifier: self.sceneIdentifier) as? Self else {
      fatalError("The viewController '\(self.sceneIdentifier)' of '\(storyboard)' is not of class '\(self)'")
    }
    return vc
  }
}
