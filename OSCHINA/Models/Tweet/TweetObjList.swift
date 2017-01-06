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


	class func newInstance(_ map: Map) -> Mappable?{
		return TweetObjList()
	}
    required init?(map: Map) {
        super.init()
    }

	fileprivate override init(){}

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
         appclient = aDecoder.decodeObject(forKey: "appclient") as? Int
         author = aDecoder.decodeObject(forKey: "author") as? TweetAuthor
         body = aDecoder.decodeObject(forKey: "body") as? String
         commentCount = aDecoder.decodeObject(forKey: "comment_count") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         isLike = aDecoder.decodeObject(forKey: "is_like") as? Int
         likeCount = aDecoder.decodeObject(forKey: "like_count") as? Int
         mUrl = aDecoder.decodeObject(forKey: "m_url") as? String
         pubDate = aDecoder.decodeObject(forKey: "pub_date") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if appclient != nil{
			aCoder.encode(appclient, forKey: "appclient")
		}
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
		if isLike != nil{
			aCoder.encode(isLike, forKey: "is_like")
		}
		if likeCount != nil{
			aCoder.encode(likeCount, forKey: "like_count")
		}
		if mUrl != nil{
			aCoder.encode(mUrl, forKey: "m_url")
		}
		if pubDate != nil{
			aCoder.encode(pubDate, forKey: "pub_date")
		}

	}

}
