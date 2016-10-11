//
//	BannerItem.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class BannerItem: NSObject, NSCoding, Mappable {

	var detail: String?
	var href: String?
	var id: Int?
	var img: String?
	var name: String?
	var pubDate: String?
	var type: Int?


	class func newInstance(map: Map) -> Mappable? {
		return BannerItem()
	}

    required init?(_ map: Map) {
        super.init()
    }

	private override init() {}

	func mapping(map: Map) {
		detail <- map["detail"]
		href <- map["href"]
		id <- map["id"]
		img <- map["img"]
		name <- map["name"]
		pubDate <- map["pubDate"]
		type <- map["type"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         detail = aDecoder.decodeObjectForKey("detail") as? String
         href = aDecoder.decodeObjectForKey("href") as? String
         id = aDecoder.decodeObjectForKey("id") as? Int
         img = aDecoder.decodeObjectForKey("img") as? String
         name = aDecoder.decodeObjectForKey("name") as? String
         pubDate = aDecoder.decodeObjectForKey("pubDate") as? String
         type = aDecoder.decodeObjectForKey("type") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder) {
		if detail != nil {
			aCoder.encodeObject(detail, forKey: "detail")
		}
		if href != nil {
			aCoder.encodeObject(href, forKey: "href")
		}
		if id != nil {
			aCoder.encodeObject(id, forKey: "id")
		}
		if img != nil {
			aCoder.encodeObject(img, forKey: "img")
		}
		if name != nil {
			aCoder.encodeObject(name, forKey: "name")
		}
		if pubDate != nil {
			aCoder.encodeObject(pubDate, forKey: "pubDate")
		}
		if type != nil {
			aCoder.encodeObject(type, forKey: "type")
		}

	}

}
