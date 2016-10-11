//
//	BlogAuthor.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper


class BlogAuthor : NSObject, NSCoding, Mappable{

	var id : Int?
	var name : String?
	var portrait : String?


	class func newInstance(map: Map) -> Mappable?{
		return BlogAuthor()
	}
    required init?(_ map: Map) {
        super.init()
    }
	private override init(){}

	func mapping(map: Map)
	{
		id <- map["id"]
		name <- map["name"]
		portrait <- map["portrait"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         id = aDecoder.decodeObjectForKey("id") as? Int
         name = aDecoder.decodeObjectForKey("name") as? String
         portrait = aDecoder.decodeObjectForKey("portrait") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if id != nil{
			aCoder.encodeObject(id, forKey: "id")
		}
		if name != nil{
			aCoder.encodeObject(name, forKey: "name")
		}
		if portrait != nil{
			aCoder.encodeObject(portrait, forKey: "portrait")
		}

	}

}