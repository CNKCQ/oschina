//
//	NewsItem.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class NewsItem: NSObject, NSCoding, Mappable {

    var author: String?
    var body: String?
    var commentCount: Int?
    var href: String?
    var id: Int?
    var pubDate: String?
    var recommend: Bool?
    var title: String?
    var type: Int?
    var viewCount: Int?

    class func newInstance(_: Map) -> Mappable? {
        return NewsItem()
    }

    required init?(map _: Map) {
        super.init()
    }

    fileprivate override init() {}

    func mapping(map: Map) {
        author <- map["author"]
        body <- map["body"]
        commentCount <- map["commentCount"]
        href <- map["href"]
        id <- map["id"]
        pubDate <- map["pubDate"]
        recommend <- map["recommend"]
        title <- map["title"]
        type <- map["type"]
        viewCount <- map["viewCount"]
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder) {
        author = aDecoder.decodeObject(forKey: "author") as? String
        body = aDecoder.decodeObject(forKey: "body") as? String
        commentCount = aDecoder.decodeObject(forKey: "commentCount") as? Int
        href = aDecoder.decodeObject(forKey: "href") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        pubDate = aDecoder.decodeObject(forKey: "pubDate") as? String
        recommend = aDecoder.decodeObject(forKey: "recommend") as? Bool
        title = aDecoder.decodeObject(forKey: "title") as? String
        type = aDecoder.decodeObject(forKey: "type") as? Int
        viewCount = aDecoder.decodeObject(forKey: "viewCount") as? Int
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder) {
        if author != nil {
            aCoder.encode(author, forKey: "author")
        }
        if body != nil {
            aCoder.encode(body, forKey: "body")
        }
        if commentCount != nil {
            aCoder.encode(commentCount, forKey: "commentCount")
        }
        if href != nil {
            aCoder.encode(href, forKey: "href")
        }
        if id != nil {
            aCoder.encode(id, forKey: "id")
        }
        if pubDate != nil {
            aCoder.encode(pubDate, forKey: "pubDate")
        }
        if recommend != nil {
            aCoder.encode(recommend, forKey: "recommend")
        }
        if title != nil {
            aCoder.encode(title, forKey: "title")
        }
        if type != nil {
            aCoder.encode(type, forKey: "type")
        }
        if viewCount != nil {
            aCoder.encode(viewCount, forKey: "viewCount")
        }
    }

    //    override var description: String {
    //        return "helo"
    //    }
}
