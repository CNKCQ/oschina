//
//	NewsObjList.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class NewsObjList : NSObject, NSCoding, Mappable{

	var author : NewsAuthor?
	var body : String?
	var commentCount : Int?
	var id : Int?
	var pubDate : String?
	var title : String?
	var type : Int?
	var url : String?


    required init?(map: Map) {
        super.init()
    }

	class func newInstance(map: Map) -> Mappable?{
		return NewsObjList()
	}
	private override init(){}

	func mapping(map: Map)
	{
		author <- map["author"]
		body <- map["body"]
		commentCount <- map["comment_count"]
		id <- map["id"]
		pubDate <- map["pub_date"]
		title <- map["title"]
		type <- map["type"]
		url <- map["url"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         author = aDecoder.decodeObject(forKey: "author") as? NewsAuthor
         body = aDecoder.decodeObject(forKey: "body") as? String
         commentCount = aDecoder.decodeObject(forKey: "comment_count") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         pubDate = aDecoder.decodeObject(forKey: "pub_date") as? String
         title = aDecoder.decodeObject(forKey: "title") as? String
         type = aDecoder.decodeObject(forKey: "type") as? Int
         url = aDecoder.decodeObject(forKey: "url") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if author != nil{
			aCoder.encode(author, forKey: "author")
		}
		if body != nil{
			aCoder.encode(body, forKey: "body")
		}
		if commentCount != nil{
			aCoder.encode(commentCount, forKey: "comment_count")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if pubDate != nil{
			aCoder.encode(pubDate, forKey: "pub_date")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}

	}

}
