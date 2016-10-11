//
//	NewsRootClass.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class NewsRootClass: NSObject, NSCoding, Mappable {

	var code: Int?
	var message: String?
	var result: NewsResult?
	var time: String?


	class func newInstance(map: Map) -> Mappable? {
		return NewsRootClass()
	}

    required init?(_ map: Map) {
        super.init()
    }

	private override init() {}

	func mapping(map: Map) {
		code <- map["code"]
		message <- map["message"]
		result <- map["result"]
		time <- map["time"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         code = aDecoder.decodeObjectForKey("code") as? Int
         message = aDecoder.decodeObjectForKey("message") as? String
         result = aDecoder.decodeObjectForKey("result") as? NewsResult
         time = aDecoder.decodeObjectForKey("time") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder) {
		if code != nil {
			aCoder.encodeObject(code, forKey: "code")
		}
		if message != nil {
			aCoder.encodeObject(message, forKey: "message")
		}
		if result != nil {
			aCoder.encodeObject(result, forKey: "result")
		}
		if time != nil {
			aCoder.encodeObject(time, forKey: "time")
		}

	}

}
