//
//	LoginRootClass.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class LoginRootClass: NSObject, NSCoding, Mappable {

	var code: Int?
	var user: User?


	class func newInstance(map: Map) -> Mappable? {
		return LoginRootClass()
	}

    required init?(_ map: Map) {
        super.init()
    }

	private override init() {}

	func mapping(map: Map) {
		code <- map["code"]
		user <- map["obj_data"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         code = aDecoder.decodeObjectForKey("code") as? Int
         user = aDecoder.decodeObjectForKey("obj_data") as? User

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder) {
		if code != nil {
			aCoder.encodeObject(code, forKey: "code")
		}
		if user != nil {
			aCoder.encodeObject(user, forKey: "obj_data")
		}

	}

}
