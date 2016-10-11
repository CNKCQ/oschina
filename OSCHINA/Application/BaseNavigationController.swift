//
//  BaseNavigationController.swift
//  OSCHINA
//
//  Created by KingCQ on 16/8/9.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = appColor
    }
}
