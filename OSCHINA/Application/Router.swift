//
//  Router.swift
//  OSCHINA
//
//  Created by Steve on 2017/6/22.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import Foundation

enum RouterStyle {
    case push
    case present
}

extension  UIViewController {

    func router<T: Routerable>(intentType: T.Type, para: T.Parameterable, style: RouterStyle = .push, animated: Bool = true, completion: (() -> Void)? = nil) where T: UIViewController {
        var intent = intentType.init()
        intent.para = para
        switch style {
        case .push:
            intent.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(intent, animated: animated)
        case .present:
            present(intent, animated: animated, completion: completion)
        }
    }

    func router(intentType: UIViewController.Type, style: RouterStyle = .push, animated: Bool = true, completion: (() -> Void)? = nil) {
        let intent = intentType.init()
        switch style {
        case .push:
            intent.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(intent, animated: animated)
        case .present:
            present(intent, animated: animated, completion: completion)
        }
    }
}

protocol Routerable {

    associatedtype Parameterable

    var para: Parameterable { set get }

}

protocol Testable {

}

