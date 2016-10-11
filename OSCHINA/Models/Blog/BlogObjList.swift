//
//	BlogObjList.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper


class BlogObjList : NSObject, NSCoding, Mappable{

	var author : BlogAuthor?
	var body : String?
	var commentCount : Int?
	var documentType : Int?
	var id : Int?
	var pubDate : String?
	var title : String?
	var url : String?


	class func newInstance(map: Map) -> Mappable?{
		return BlogObjList()
	}
    required init?(_ map: Map) {
        super.init()
    }
	private override init(){}

	func mapping(map: Map)
	{
		author <- map["author"]
		body <- map["body"]
		commentCount <- map["comment_count"]
		documentType <- map["document_type"]
		id <- map["id"]
		pubDate <- map["pub_date"]
		title <- map["title"]
		url <- map["url"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         author = aDecoder.decodeObjectForKey("author") as? BlogAuthor
         body = aDecoder.decodeObjectForKey("body") as? String
         commentCount = aDecoder.decodeObjectForKey("comment_count") as? Int
         documentType = aDecoder.decodeObjectForKey("document_type") as? Int
         id = aDecoder.decodeObjectForKey("id") as? Int
         pubDate = aDecoder.decodeObjectForKey("pub_date") as? String
         title = aDecoder.decodeObjectForKey("title") as? String
         url = aDecoder.decodeObjectForKey("url") as? String

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
			aCoder.encodeObject(commentCount, forKey: "comment_count")
		}
		if documentType != nil{
			aCoder.encodeObject(documentType, forKey: "document_type")
		}
		if id != nil{
			aCoder.encodeObject(id, forKey: "id")
		}
		if pubDate != nil{
			aCoder.encodeObject(pubDate, forKey: "pub_date")
		}
		if title != nil{
			aCoder.encodeObject(title, forKey: "title")
		}
		if url != nil{
			aCoder.encodeObject(url, forKey: "url")
		}

	}

}