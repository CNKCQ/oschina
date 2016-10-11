//
//	FindRootClass.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper


class FindRootClass: NSObject, NSCoding, Mappable {

	var code: Int?
	var objList: [FindObjList]?


	class func newInstance(map: Map) -> Mappable? {
		return FindRootClass()
	}

    required init?(_ map: Map) {
        super.init()
    }

	private override init() {}

	func mapping(map: Map) {
		code <- map["code"]
		objList <- map["obj_list"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         code = aDecoder.decodeObjectForKey("code") as? Int
         objList = aDecoder.decodeObjectForKey("obj_list") as? [FindObjList]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder) {
		if code != nil {
			aCoder.encodeObject(code, forKey: "code")
		}
		if objList != nil {
			aCoder.encodeObject(objList, forKey: "obj_list")
		}

	}

}
