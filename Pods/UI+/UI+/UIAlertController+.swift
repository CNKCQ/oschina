//
//  UIAlertController+.swift
//  Elegant
//
//  Created by Steve on 2017/5/24.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

/// Show alert
///
/// - Parameters:
///   - title: message title
///   - message: message content
///   - cancelAction: cancel callback
///   - okAction: okcallback
public func alert(
    title: String,
    message: String,
    cancelAction: ((UIAlertAction?) -> Void)? = nil,
    okAction: ((UIAlertAction?) -> Void)? = nil) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    if let ok = okAction {
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: ok))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: cancelAction))
    } else {
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: cancelAction))
    }
    UIWindow.visibleViewController.present(alert, animated: true, completion: nil)
}

/// Show actionSheet
///
/// - Parameters:
///   - title: message title
///   - message: message content
///   - actions: The set of the actions
public func actionSheet(
    title: String,
    message: String,
    actions: [UIAlertAction]) {
    let sheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    actions.forEach({ sheet.addAction($0) })
    UIWindow.visibleViewController.present(sheet, animated: true, completion: nil)
}
