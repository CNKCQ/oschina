//
//  BaseTabBarController.swift
//  OSCHINA
//
//  Created by KingCQ on 16/8/9.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = appColor
        selectedIndex = 0
        let controller1 = NewsList()
        let controller2 = DiscoverController()
        controller2.title = "发现"
        let controller3 = MineController()
        controller3.title = "我"
        let controllers: [(String, UIImage, UIImage, UIViewController)] = [
            (title: "综合", imge: UIImage(named: "tabbar-news")!, simage: UIImage(named: "tabbar-news-selected")!, controller1),
            (title: "发现", imge: UIImage(named: "tabbar-discover")!, simage: UIImage(named: "tabbar-discover-selected")!, controller2),
            (title: "我", imge: UIImage(named: "tabbar-me")!, simage: UIImage(named: "tabbar-me-selected")!, controller3)
        ]
        controllers.forEach {
            self.append($3, title: $0, image: $1, selectedImage: $2)
        }
    }

    func append(_ controller: UIViewController, title: String? = nil, image: UIImage? = nil, selectedImage: UIImage? = nil) {
        controller.tabBarItem.title = title
        controller.tabBarItem.image = image
        controller.tabBarItem.selectedImage = selectedImage
        addChildViewController(UINavigationController(rootViewController: controller))
    }
}
