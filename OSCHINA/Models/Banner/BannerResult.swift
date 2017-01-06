//
//	BannerResult.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class BannerResult: NSObject, NSCoding, Mappable {

	var items: [BannerItem]?
	var nextPageToken: String?
	var pageInfo: BannerPageInfo?
	var prevPageToken: String?


	class func newInstance(_ map: Map) -> Mappable? {
		return BannerResult()
	}
    required init?(map: Map) {
        super.init()
    }
	fileprivate override init() {}

	func mapping(map: Map) {
		items <- map["items"]
		nextPageToken <- map["nextPageToken"]
		pageInfo <- map["pageInfo"]
		prevPageToken <- map["prevPageToken"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         items = aDecoder.decodeObject(forKey: "items") as? [BannerItem]
         nextPageToken = aDecoder.decodeObject(forKey: "nextPageToken") as? String
         pageInfo = aDecoder.decodeObject(forKey: "pageInfo") as? BannerPageInfo
         prevPageToken = aDecoder.decodeObject(forKey: "prevPageToken") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder) {
		if items != nil {
			aCoder.encode(items, forKey: "items")
		}
		if nextPageToken != nil {
			aCoder.encode(nextPageToken, forKey: "nextPageToken")
		}
		if pageInfo != nil {
			aCoder.encode(pageInfo, forKey: "pageInfo")
		}
		if prevPageToken != nil {
			aCoder.encode(prevPageToken, forKey: "prevPageToken")
		}

	}

}
