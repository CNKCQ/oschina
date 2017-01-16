//
//  AppDelegate.swift
//  OSCHINA
//
//  Created by KingCQ on 16/8/9.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        let rootViewController = BaseTabBarController()
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        return true
    }
}

