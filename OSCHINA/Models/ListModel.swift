//
//  ListModel.swift
//  OSCHINA
//
//  Created by KingCQ on 2017/2/24.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import Foundation

struct ListModel: Codable {

    var items: [BannerItem]?
    var nextPageToken: String?
    var pageInfo: BannerPageInfo?
    var prevPageToken: String?
    
//    enum CodingKeys: String, CodingKey {
//        case items
//        case nextPageToken
//        case pageInfo
//        case prevPageToken
//    }
}

