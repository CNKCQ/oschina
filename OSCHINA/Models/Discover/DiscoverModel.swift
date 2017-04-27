//
//  DiscoverModel.swift
//  OSCHINA
//
//  Created by KingCQ on 2017/1/15.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import Foundation
import ObjectMapper

class ArticleEntity: Mappable {

    var who: String?
    var id: String?
    var desc: String?
    var publishedAt: Date?
    var used: Int?
    var createdAt: Date?
    var url: String?
    var type: String?

    // MARK: Mappable
    func mapping(map: Map) {
        who <- map["who"]
        id <- map["_id"]
        desc <- map["desc"]
        publishedAt <- (map["publishedAt"], CustomDateFormatTransform(formatString: DateUtil.dateFormatter))
        used <- map["used"]
        createdAt <- (map["createdAt"], CustomDateFormatTransform(formatString: DateUtil.dateFormatter))
        url <- map["url"]
        type <- map["type"]
    }

    required init?(map _: Map) {
    }
}

public class DateUtil {

    static let dateFormatter = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

    public static func stringToNSDate(dateString: String, formatter: String = dateFormatter) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        return dateFormatter.date(from: dateString)!
    }

    public static func nsDateToString(date: Date, formatter: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        return dateFormatter.string(from: date)
    }

    public static func areDatesSameDay(dateOne _: Date, dateTwo _: Date) -> Bool {
        return true
    }
}
