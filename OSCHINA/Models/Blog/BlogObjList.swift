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


	class func newInstance(_ map: Map) -> Mappable?{
		return BlogObjList()
	}
    required init?(_ map: Map) {
        super.init()
    }
	fileprivate override init(){}

	func mapping(_ map: Map)
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
         author = aDecoder.decodeObject(forKey: "author") as? BlogAuthor
         body = aDecoder.decodeObject(forKey: "body") as? String
         commentCount = aDecoder.decodeObject(forKey: "comment_count") as? Int
         documentType = aDecoder.decodeObject(forKey: "document_type") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         pubDate = aDecoder.decodeObject(forKey: "pub_date") as? String
         title = aDecoder.decodeObject(forKey: "title") as? String
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
		if documentType != nil{
			aCoder.encode(documentType, forKey: "document_type")
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
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}

	}

}
