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


	class func newInstance(_ map: Map) -> Mappable?{
		return FindObjList()
	}
    
    required init?(map: Map) {
        super.init()
    }
    
	fileprivate override init(){}

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
         from = aDecoder.decodeObject(forKey: "from") as? String
         gender = aDecoder.decodeObject(forKey: "gender") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         portrait = aDecoder.decodeObject(forKey: "portrait") as? String
         relation = aDecoder.decodeObject(forKey: "relation") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if from != nil{
			aCoder.encode(from, forKey: "from")
		}
		if gender != nil{
			aCoder.encode(gender, forKey: "gender")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if portrait != nil{
			aCoder.encode(portrait, forKey: "portrait")
		}
		if relation != nil{
			aCoder.encode(relation, forKey: "relation")
		}

	}

}
