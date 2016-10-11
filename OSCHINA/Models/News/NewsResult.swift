//
//	NewsResult.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class NewsResult : NSObject, NSCoding, Mappable{

	var items : [NewsItem]?
	var nextPageToken : String?
	var pageInfo : NewsPageInfo?
	var prevPageToken : String?


	class func newInstance(map: Map) -> Mappable?{
		return NewsResult()
	}
    required init?(_ map: Map) {
        super.init()
    }
    
	private override init(){}

	func mapping(map: Map)
	{
		items <- map["items"]
		nextPageToken <- map["nextPageToken"]
		pageInfo <- map["pageInfo"]
		prevPageToken <- map["prevPageToken"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         items = aDecoder.decodeObjectForKey("items") as? [NewsItem]
         nextPageToken = aDecoder.decodeObjectForKey("nextPageToken") as? String
         pageInfo = aDecoder.decodeObjectForKey("pageInfo") as? NewsPageInfo
         prevPageToken = aDecoder.decodeObjectForKey("prevPageToken") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if items != nil{
			aCoder.encodeObject(items, forKey: "items")
		}
		if nextPageToken != nil{
			aCoder.encodeObject(nextPageToken, forKey: "nextPageToken")
		}
		if pageInfo != nil{
			aCoder.encodeObject(pageInfo, forKey: "pageInfo")
		}
		if prevPageToken != nil{
			aCoder.encodeObject(prevPageToken, forKey: "prevPageToken")
		}

	}

}