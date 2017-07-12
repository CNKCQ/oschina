//
//  NewsHeader.swift
//  OSCHINA
//
//  Created by KingCQ on 2017/1/10.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import AutoCycleAdview
import UIKit

class NewsHeader: UICollectionReusableView, Reusable {
    var banner: AutoCycleAdview!

    override init(frame: CGRect) {
        super.init(frame: frame)
        banner = AutoCycleAdview(frame: CGRect(origin: .zero, size: CGSize(width: screenWidth, height: 180)))
        backgroundColor = .red
        addSubview(banner)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
