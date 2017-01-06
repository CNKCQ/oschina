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


	class func newInstance(_ map: Map) -> Mappable?{
		return NewsResult()
	}
    required init?(_ map: Map) {
        super.init()
    }
    
	fileprivate override init(){}

	func mapping(_ map: Map)
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
         items = aDecoder.decodeObject(forKey: "items") as? [NewsItem]
         nextPageToken = aDecoder.decodeObject(forKey: "nextPageToken") as? String
         pageInfo = aDecoder.decodeObject(forKey: "pageInfo") as? NewsPageInfo
         prevPageToken = aDecoder.decodeObject(forKey: "prevPageToken") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if items != nil{
			aCoder.encode(items, forKey: "items")
		}
		if nextPageToken != nil{
			aCoder.encode(nextPageToken, forKey: "nextPageToken")
		}
		if pageInfo != nil{
			aCoder.encode(pageInfo, forKey: "pageInfo")
		}
		if prevPageToken != nil{
			aCoder.encode(prevPageToken, forKey: "prevPageToken")
		}

	}

}
