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
        publishedAt <- (map["publishedAt"], CustomDateFormatTransform(formatString: DateUtil.DATE_FORMATTER))
        used <- map["used"]
        createdAt <- (map["createdAt"], CustomDateFormatTransform(formatString: DateUtil.DATE_FORMATTER))
        url <- map["url"]
        type <- map["type"]
    }

    required init?(_: Map) {
    }
}

public class DateUtil {

    static let DATE_FORMATTER = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

    public static func stringToNSDate(dateString: String, formatter: String = DATE_FORMATTER) -> Date {
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
