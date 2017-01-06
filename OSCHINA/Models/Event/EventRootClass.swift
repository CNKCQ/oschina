//
//	EventRootClass.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class EventRootClass: NSObject, NSCoding, Mappable {

	var code: Int?
	var objList: [EventObjList]?


	class func newInstance(_ map: Map) -> Mappable? {
		return EventRootClass()
	}
    required init?(_ map: Map) {
        super.init()
    }

	fileprivate override init() {}

	func mapping(_ map: Map) {
		code <- map["code"]
		objList <- map["obj_list"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         code = aDecoder.decodeObject(forKey: "code") as? Int
         objList = aDecoder.decodeObject(forKey: "obj_list") as? [EventObjList]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder) {
		if code != nil {
			aCoder.encode(code, forKey: "code")
		}
		if objList != nil {
			aCoder.encode(objList, forKey: "obj_list")
		}

	}

}
