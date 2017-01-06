//
//  Wireframe.swift
//  Example
//
//  Created by Krunoslav Zaher on 4/3/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation
#if !RX_NO_MODULE
import RxSwift
#endif

#if os(iOS)
import UIKit
#elseif os(OSX)
import Cocoa
#endif

enum RetryResult {
    case retry
    case cancel
}

protocol Wireframe {
    func openURL(_ URL: URL)
    func promptFor<Action: CustomStringConvertible>(_ message: String, cancelAction: Action, actions: [Action]) -> Observable<Action>
}


class DefaultWireframe: Wireframe {
    static let sharedInstance = DefaultWireframe()

    func openURL(_ URL: Foundation.URL) {
        #if os(iOS)
            UIApplication.shared.openURL(URL)
        #elseif os(OSX)
            NSWorkspace.sharedWorkspace().openURL(URL)
        #endif
    }

    #if os(iOS)
    fileprivate static func rootViewController() -> UIViewController {
        // cheating, I know
        return UIApplication.shared.keyWindow!.rootViewController!
    }
    #endif

    static func presentAlert(_ message: String) {
        #if os(iOS)
            let alertView = UIAlertController(title: "温馨提示", message: message, preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: "OK", style: .cancel) { _ in
            })
            rootViewController().present(alertView, animated: true, completion: nil)
        #endif
    }

    func promptFor<Action: CustomStringConvertible>(_ message: String, cancelAction: Action, actions: [Action]) -> Observable<Action> {
        #if os(iOS)
        return Observable.create { observer in
            let alertView = UIAlertController(title: "温馨提示", message: message, preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: cancelAction.description, style: .Cancel) { _ in
                observer.on(.Next(cancelAction))
            })

            for action in actions {
                alertView.addAction(UIAlertAction(title: action.description, style: .Default) { _ in
                    observer.on(.Next(action))
                })
            }

            DefaultWireframe.rootViewController().presentViewController(alertView, animated: true, completion: nil)

            return AnonymousDisposable {
                alertView.dismissViewControllerAnimated(false, completion: nil)
            }
        }
        #elseif os(OSX)
            return Observable.error(NSError(domain: "Unimplemented", code: -1, userInfo: nil))
        #endif
    }
}


extension RetryResult : CustomStringConvertible {
    var description: String {
        switch self {
        case .retry:
            return "Retry"
        case .cancel:
            return "Cancel"
        }
    }
}
