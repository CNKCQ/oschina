//
//  NewsHeader.swift
//  OSCHINA
//
//  Created by KingCQ on 2017/1/10.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

class NewsHeader: UICollectionReusableView, Reusable {
    var banner: SycleAdContainer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        banner = SycleAdContainer(frame: frame)
        addSubview(banner)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
