//
//	FindObjList.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper


class FindObjList : NSObject, NSCoding, Mappable{

	var from : String?
	var gender : Int?
	var id : Int?
	var name : String?
	var portrait : String?
	var relation : Int?


	class func newInstance(map: Map) -> Mappable?{
		return FindObjList()
	}
    
    required init?(_ map: Map) {
        super.init()
    }
    
	private override init(){}

	func mapping(map: Map)
	{
		from <- map["from"]
		gender <- map["gender"]
		id <- map["id"]
		name <- map["name"]
		portrait <- map["portrait"]
		relation <- map["relation"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         from = aDecoder.decodeObjectForKey("from") as? String
         gender = aDecoder.decodeObjectForKey("gender") as? Int
         id = aDecoder.decodeObjectForKey("id") as? Int
         name = aDecoder.decodeObjectForKey("name") as? String
         portrait = aDecoder.decodeObjectForKey("portrait") as? String
         relation = aDecoder.decodeObjectForKey("relation") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if from != nil{
			aCoder.encodeObject(from, forKey: "from")
		}
		if gender != nil{
			aCoder.encodeObject(gender, forKey: "gender")
		}
		if id != nil{
			aCoder.encodeObject(id, forKey: "id")
		}
		if name != nil{
			aCoder.encodeObject(name, forKey: "name")
		}
		if portrait != nil{
			aCoder.encodeObject(portrait, forKey: "portrait")
		}
		if relation != nil{
			aCoder.encodeObject(relation, forKey: "relation")
		}

	}

}