//
//  NewsLayout.swift
//  OSCHINA
//
//  Created by KingCQ on 2017/1/9.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

class NewsLayout {

    var data: NewsObjList!
    var title = CGRect()
    var content = CGRect()
    var height: CGFloat = 0
    let padding: CGFloat = 15

    init(_ data: NewsObjList) {
        self.data = data
        layout()
    }

    func layout() {
        layoutTitle()
        layoutContent()
        height = title.height + content.height + padding * 2
    }

    func layoutTitle() {
        let text = data.title as NSString!
        let textSize = text?.boundingRect(with: CGSize(width: SCREEN_WIDTH - 2 * padding, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: UILabel().font], context: nil)
        title = CGRect(origin: CGPoint(x: padding, y: padding), size: (textSize?.size)!)
    }

    func layoutContent() {
        let text = data.body as NSString!
        let textSize = text?.boundingRect(with: CGSize(width: SCREEN_WIDTH - 2 * padding, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: UILabel().font], context: nil)
        content = CGRect(origin: CGPoint(x: title.minX, y: title.maxY), size: (textSize?.size)!)
    }
}
