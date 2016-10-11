//
//  Copyright © 2016年 cmcaifu.com. All rights reserved.
//  Created by KingCQ on 16/7/25.
//

import PagingMenuController
import UIKit

private struct PagingMenuOptions: PagingMenuControllerCustomizable {
    private var componentType: ComponentType {
        return .All(menuOptions: MenuOptions(), pagingControllers: [NewsList(), BlogList(), EventList()])
    }

    private struct MenuOptions: MenuViewCustomizable {
        var height: CGFloat {
            return 40
        }
        var animationDuration: NSTimeInterval {
            return 0
        }
        var displayMode: MenuDisplayMode {
            return .SegmentedControl
        }
        var focusMode: MenuFocusMode {
            return .Underline(height: 3, color: UIColor.orangeColor(), horizontalPadding: 36.5, verticalPadding: 0)
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [NewsItem(), BlogItem(), EventItem()]
        }
    }

    private struct NewsItem: MenuItemViewCustomizable {
        var horizontalMargin: CGFloat {
            return SCREEN_WIDTH / 3
        }
        var displayMode: MenuItemDisplayMode {
            return .Text(title: MenuItemText(text: "资讯", color: UIColor.grayColor(), selectedColor: UIColor.orangeColor(), font: UIFont.systemFontOfSize(UIFont.systemFontSize())))
        }
    }

    private struct BlogItem: MenuItemViewCustomizable {
        var horizontalMargin: CGFloat {
            return SCREEN_WIDTH / 3
        }
        var displayMode: MenuItemDisplayMode {
            return .Text(title: MenuItemText(text: "博客", color: UIColor.grayColor(), selectedColor: UIColor.orangeColor(), font: UIFont.systemFontOfSize(UIFont.systemFontSize())))
        }
    }

    private struct EventItem: MenuItemViewCustomizable {
        var horizontalMargin: CGFloat {
            return SCREEN_WIDTH / 3
        }
        var displayMode: MenuItemDisplayMode {
            return .Text(title: MenuItemText(text: "活动", color: UIColor.grayColor(), selectedColor: UIColor.orangeColor(), font: UIFont.systemFontOfSize(UIFont.systemFontSize())))
        }
    }

}

class HomeController: BaseController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "综合"
        let options = PagingMenuOptions()
        let pagingMenuController = PagingMenuController(options: options)
        pagingMenuController.view.frame.origin.y += 64
        pagingMenuController.view.frame.size.height -= 64
        addChildViewController(pagingMenuController)
        view.addSubview(pagingMenuController.view)
        pagingMenuController.didMoveToParentViewController(self)

    }
}
