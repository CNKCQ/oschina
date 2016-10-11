//
//  BaseTabBarController.swift
//  OSCHINA
//
//  Created by KingCQ on 16/8/9.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit
import CYLTabBarController

class BaseTabBarController: CYLTabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = appColor
        selectedIndex = 0
    }

}
