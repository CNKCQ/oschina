//
//	NewsItem.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper


class NewsItem : NSObject, NSCoding, Mappable{

	var author : String?
	var body : String?
	var commentCount : Int?
	var href : String?
	var id : Int?
	var pubDate : String?
	var recommend : Bool?
	var title : String?
	var type : Int?
	var viewCount : Int?


	class func newInstance(map: Map) -> Mappable?{
		return NewsItem()
	}
    
    required init?(_ map: Map) {
        super.init()
    }
    
	private override init(){}

	func mapping(map: Map)
	{
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
    @objc required init(coder aDecoder: NSCoder)
	{
         author = aDecoder.decodeObjectForKey("author") as? String
         body = aDecoder.decodeObjectForKey("body") as? String
         commentCount = aDecoder.decodeObjectForKey("commentCount") as? Int
         href = aDecoder.decodeObjectForKey("href") as? String
         id = aDecoder.decodeObjectForKey("id") as? Int
         pubDate = aDecoder.decodeObjectForKey("pubDate") as? String
         recommend = aDecoder.decodeObjectForKey("recommend") as? Bool
         title = aDecoder.decodeObjectForKey("title") as? String
         type = aDecoder.decodeObjectForKey("type") as? Int
         viewCount = aDecoder.decodeObjectForKey("viewCount") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if author != nil{
			aCoder.encodeObject(author, forKey: "author")
		}
		if body != nil{
			aCoder.encodeObject(body, forKey: "body")
		}
		if commentCount != nil{
			aCoder.encodeObject(commentCount, forKey: "commentCount")
		}
		if href != nil{
			aCoder.encodeObject(href, forKey: "href")
		}
		if id != nil{
			aCoder.encodeObject(id, forKey: "id")
		}
		if pubDate != nil{
			aCoder.encodeObject(pubDate, forKey: "pubDate")
		}
		if recommend != nil{
			aCoder.encodeObject(recommend, forKey: "recommend")
		}
		if title != nil{
			aCoder.encodeObject(title, forKey: "title")
		}
		if type != nil{
			aCoder.encodeObject(type, forKey: "type")
		}
		if viewCount != nil{
			aCoder.encodeObject(viewCount, forKey: "viewCount")
		}

	}

}