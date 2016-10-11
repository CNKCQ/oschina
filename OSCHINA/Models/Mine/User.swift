//
//	LoginObjData.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper


class User: NSObject, NSCoding, Mappable {

	var devplatform: String?
	var expertise: String?
	var fans: Int?
	var favoriteCount: Int?
	var followers: Int?
	var from: String?
	var gender: Int?
	var token: Int?
	var jointime: String?
	var latestonline: String?
	var name: String?
	var portrait: String?
	var score: Int?


	class func newInstance(map: Map) -> Mappable? {
		return User()
	}
    required init?(_ map: Map) {
        super.init()
    }
	private override init() {}

	func mapping(map: Map) {
		devplatform <- map["devplatform"]
		expertise <- map["expertise"]
		fans <- map["fans"]
		favoriteCount <- map["favorite_count"]
		followers <- map["followers"]
		from <- map["from"]
		gender <- map["gender"]
		token <- map["id"]
		jointime <- map["jointime"]
		latestonline <- map["latestonline"]
		name <- map["name"]
		portrait <- map["portrait"]
		score <- map["score"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         devplatform = aDecoder.decodeObjectForKey("devplatform") as? String
         expertise = aDecoder.decodeObjectForKey("expertise") as? String
         fans = aDecoder.decodeObjectForKey("fans") as? Int
         favoriteCount = aDecoder.decodeObjectForKey("favorite_count") as? Int
         followers = aDecoder.decodeObjectForKey("followers") as? Int
         from = aDecoder.decodeObjectForKey("from") as? String
         gender = aDecoder.decodeObjectForKey("gender") as? Int
         token = aDecoder.decodeObjectForKey("id") as? Int
         jointime = aDecoder.decodeObjectForKey("jointime") as? String
         latestonline = aDecoder.decodeObjectForKey("latestonline") as? String
         name = aDecoder.decodeObjectForKey("name") as? String
         portrait = aDecoder.decodeObjectForKey("portrait") as? String
         score = aDecoder.decodeObjectForKey("score") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder) {
		if devplatform != nil {
			aCoder.encodeObject(devplatform, forKey: "devplatform")
		}
		if expertise != nil {
			aCoder.encodeObject(expertise, forKey: "expertise")
		}
		if fans != nil {
			aCoder.encodeObject(fans, forKey: "fans")
		}
		if favoriteCount != nil {
			aCoder.encodeObject(favoriteCount, forKey: "favorite_count")
		}
		if followers != nil {
			aCoder.encodeObject(followers, forKey: "followers")
		}
		if from != nil {
			aCoder.encodeObject(from, forKey: "from")
		}
		if gender != nil {
			aCoder.encodeObject(gender, forKey: "gender")
		}
		if token != nil {
			aCoder.encodeObject(token, forKey: "id")
		}
		if jointime != nil {
			aCoder.encodeObject(jointime, forKey: "jointime")
		}
		if latestonline != nil {
			aCoder.encodeObject(latestonline, forKey: "latestonline")
		}
		if name != nil {
			aCoder.encodeObject(name, forKey: "name")
		}
		if portrait != nil {
			aCoder.encodeObject(portrait, forKey: "portrait")
		}
		if score != nil {
			aCoder.encodeObject(score, forKey: "score")
		}

	}

}
