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


	class func newInstance(_ map: Map) -> Mappable? {
		return User()
	}
    required init?(_ map: Map) {
        super.init()
    }
	fileprivate override init() {}

	func mapping(_ map: Map) {
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
         devplatform = aDecoder.decodeObject(forKey: "devplatform") as? String
         expertise = aDecoder.decodeObject(forKey: "expertise") as? String
         fans = aDecoder.decodeObject(forKey: "fans") as? Int
         favoriteCount = aDecoder.decodeObject(forKey: "favorite_count") as? Int
         followers = aDecoder.decodeObject(forKey: "followers") as? Int
         from = aDecoder.decodeObject(forKey: "from") as? String
         gender = aDecoder.decodeObject(forKey: "gender") as? Int
         token = aDecoder.decodeObject(forKey: "id") as? Int
         jointime = aDecoder.decodeObject(forKey: "jointime") as? String
         latestonline = aDecoder.decodeObject(forKey: "latestonline") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         portrait = aDecoder.decodeObject(forKey: "portrait") as? String
         score = aDecoder.decodeObject(forKey: "score") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder) {
		if devplatform != nil {
			aCoder.encode(devplatform, forKey: "devplatform")
		}
		if expertise != nil {
			aCoder.encode(expertise, forKey: "expertise")
		}
		if fans != nil {
			aCoder.encode(fans, forKey: "fans")
		}
		if favoriteCount != nil {
			aCoder.encode(favoriteCount, forKey: "favorite_count")
		}
		if followers != nil {
			aCoder.encode(followers, forKey: "followers")
		}
		if from != nil {
			aCoder.encode(from, forKey: "from")
		}
		if gender != nil {
			aCoder.encode(gender, forKey: "gender")
		}
		if token != nil {
			aCoder.encode(token, forKey: "id")
		}
		if jointime != nil {
			aCoder.encode(jointime, forKey: "jointime")
		}
		if latestonline != nil {
			aCoder.encode(latestonline, forKey: "latestonline")
		}
		if name != nil {
			aCoder.encode(name, forKey: "name")
		}
		if portrait != nil {
			aCoder.encode(portrait, forKey: "portrait")
		}
		if score != nil {
			aCoder.encode(score, forKey: "score")
		}

	}

}
