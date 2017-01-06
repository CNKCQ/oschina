//
//  TweetCell.swift
//  OSCHINA
//
//  Created by KingCQ on 16/9/1.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

let TABLE_VIEW_BIGROW_HEIGHT: CGFloat = 60

class TweetCell: UITableViewCell, Reusable {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.frame = CGRect(x: 15, y: (TABLE_VIEW_BIGROW_HEIGHT - 29) / 2, width: 29, height: 29)
        textLabel?.frame = CGRect(x: 29 + 15 + 10, y: 0, width: 200, height: TABLE_VIEW_BIGROW_HEIGHT / 2)
        detailTextLabel?.frame = CGRect(x: (textLabel?.frame.minX)!, y: (textLabel?.frame.maxY)!, width: (detailTextLabel?.frame.width)!, height: (textLabel?.frame.height)!)
    }
}
