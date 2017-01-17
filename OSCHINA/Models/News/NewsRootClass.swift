//
//	NewsRootClass.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper


class NewsRootClass : NSObject, NSCoding, Mappable{


	var code : Int?
	var objList : [NewsObjList]?

    required init?(map: Map) {
        super.init()
    }

	class func newInstance(map: Map) -> Mappable?{
		return NewsRootClass()
	}
	private override init(){}

	func mapping(map: Map)
	{
		code <- map["code"]
		objList <- map["obj_list"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    public func encode(with aCoder: NSCoder) {
        if code != nil{
            aCoder.encode(code, forKey: "code")
        }
        if objList != nil{
            aCoder.encode(objList, forKey: "obj_list")
        }
    }

   required init(coder aDecoder: NSCoder)
	{
         code = aDecoder.decodeObject(forKey: "code") as? Int
         objList = aDecoder.decodeObject(forKey: "obj_list") as? [NewsObjList]

	}

}
