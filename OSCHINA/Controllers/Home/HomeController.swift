//
//  Copyright © 2016年 cmcaifu.com. All rights reserved.
//  Created by KingCQ on 16/7/25.
//

import PagingMenuController
import UIKit

private struct PagingMenuOptions: PagingMenuControllerCustomizable {
    fileprivate var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: [NewsList(), BlogList(), EventList()])
    }

    fileprivate struct MenuOptions: MenuViewCustomizable {
        var height: CGFloat {
            return 40
        }
        var animationDuration: TimeInterval {
            return 0
        }
        var displayMode: MenuDisplayMode {
            return .segmentedControl
        }
        var focusMode: MenuFocusMode {
            return .underline(height: 3, color: UIColor.orange, horizontalPadding: 36.5, verticalPadding: 0)
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [NewsItem(), BlogItem(), EventItem()]
        }
    }

    fileprivate struct NewsItem: MenuItemViewCustomizable {
        var horizontalMargin: CGFloat {
            return SCREEN_WIDTH / 3
        }
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "资讯", color: UIColor.gray, selectedColor: UIColor.orange, font: UIFont.systemFont(ofSize: UIFont.systemFontSize)))
        }
    }

    fileprivate struct BlogItem: MenuItemViewCustomizable {
        var horizontalMargin: CGFloat {
            return SCREEN_WIDTH / 3
        }
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "博客", color: UIColor.gray, selectedColor: UIColor.orange, font: UIFont.systemFont(ofSize: UIFont.systemFontSize)))
        }
    }

    fileprivate struct EventItem: MenuItemViewCustomizable {
        var horizontalMargin: CGFloat {
            return SCREEN_WIDTH / 3
        }
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "活动", color: UIColor.gray, selectedColor: UIColor.orange, font: UIFont.systemFont(ofSize: UIFont.systemFontSize)))
        }
    }

}

class HomeController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "综合"
//        let options = PagingMenuOptions()
//        let pagingMenuController = PagingMenuController(options: options)
//        pagingMenuController.view.frame.origin.y += 64
//        pagingMenuController.view.frame.size.height -= 64
//        addChildViewController(pagingMenuController)
//        pagingMenuController.view.backgroundColor = UIColor.clear
//        view.addSubview(pagingMenuController.view)
//        pagingMenuController.didMove(toParentViewController: self)

    }
}
