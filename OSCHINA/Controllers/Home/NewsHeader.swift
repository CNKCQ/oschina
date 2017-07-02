//
//  NewsHeader.swift
//  OSCHINA
//
//  Created by KingCQ on 2017/1/10.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import AutoCycleAdview
import UIKit
import UI_

class NewsHeader: UICollectionReusableView, Reusable {
    var banner: AutoCycleAdview!

    override init(frame: CGRect) {
        super.init(frame: frame)
        banner = AutoCycleAdview(frame: frame)
        addSubview(banner)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
