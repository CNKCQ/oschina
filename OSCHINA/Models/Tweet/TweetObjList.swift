//
//	TweetObjList.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper


class TweetObjList : NSObject, NSCoding, Mappable{

	var appclient : Int?
	var author : TweetAuthor?
	var body : String?
	var commentCount : Int?
	var id : Int?
	var isLike : Int?
	var likeCount : Int?
	var mUrl : String?
	var pubDate : String?


	class func newInstance(map: Map) -> Mappable?{
		return TweetObjList()
	}
    required init?(_ map: Map) {
        super.init()
    }

	private override init(){}

	func mapping(map: Map)
	{
		appclient <- map["appclient"]
		author <- map["author"]
		body <- map["body"]
		commentCount <- map["comment_count"]
		id <- map["id"]
		isLike <- map["is_like"]
		likeCount <- map["like_count"]
		mUrl <- map["m_url"]
		pubDate <- map["pub_date"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         appclient = aDecoder.decodeObjectForKey("appclient") as? Int
         author = aDecoder.decodeObjectForKey("author") as? TweetAuthor
         body = aDecoder.decodeObjectForKey("body") as? String
         commentCount = aDecoder.decodeObjectForKey("comment_count") as? Int
         id = aDecoder.decodeObjectForKey("id") as? Int
         isLike = aDecoder.decodeObjectForKey("is_like") as? Int
         likeCount = aDecoder.decodeObjectForKey("like_count") as? Int
         mUrl = aDecoder.decodeObjectForKey("m_url") as? String
         pubDate = aDecoder.decodeObjectForKey("pub_date") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if appclient != nil{
			aCoder.encodeObject(appclient, forKey: "appclient")
		}
		if author != nil{
			aCoder.encodeObject(author, forKey: "author")
		}
		if body != nil{
			aCoder.encodeObject(body, forKey: "body")
		}
		if commentCount != nil{
			aCoder.encodeObject(commentCount, forKey: "comment_count")
		}
		if id != nil{
			aCoder.encodeObject(id, forKey: "id")
		}
		if isLike != nil{
			aCoder.encodeObject(isLike, forKey: "is_like")
		}
		if likeCount != nil{
			aCoder.encodeObject(likeCount, forKey: "like_count")
		}
		if mUrl != nil{
			aCoder.encodeObject(mUrl, forKey: "m_url")
		}
		if pubDate != nil{
			aCoder.encodeObject(pubDate, forKey: "pub_date")
		}

	}

}