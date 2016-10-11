//
//	BannerPageInfo.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class BannerPageInfo: NSObject, NSCoding, Mappable {

	var resultsPerPage: Int?
	var totalResults: Int?


	class func newInstance(map: Map) -> Mappable? {
		return BannerPageInfo()
	}
    required init?(_ map: Map) {
        super.init()
    }
	private override init() {}

	func mapping(map: Map) {
		resultsPerPage <- map["resultsPerPage"]
		totalResults <- map["totalResults"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         resultsPerPage = aDecoder.decodeObjectForKey("resultsPerPage") as? Int
         totalResults = aDecoder.decodeObjectForKey("totalResults") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder) {
		if resultsPerPage != nil {
			aCoder.encodeObject(resultsPerPage, forKey: "resultsPerPage")
		}
		if totalResults != nil {
			aCoder.encodeObject(totalResults, forKey: "totalResults")
		}

	}

}
