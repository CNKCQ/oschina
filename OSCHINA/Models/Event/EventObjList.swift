//
//	EventObjList.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class EventObjList : NSObject, NSCoding, Mappable{

	var applyStatus : Int?
	var city : String?
	var cover : String?
	var createTime : String?
	var endTime : String?
	var id : Int?
	var spot : String?
	var startTime : String?
	var status : Int?
	var title : String?
	var url : String?


	class func newInstance(_ map: Map) -> Mappable?{
		return EventObjList()
	}
    required init?(_ map: Map) {
        super.init()
    }

	fileprivate override init(){}

	func mapping(_ map: Map)
	{
		applyStatus <- map["apply_status"]
		city <- map["city"]
		cover <- map["cover"]
		createTime <- map["create_time"]
		endTime <- map["end_time"]
		id <- map["id"]
		spot <- map["spot"]
		startTime <- map["start_time"]
		status <- map["status"]
		title <- map["title"]
		url <- map["url"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         applyStatus = aDecoder.decodeObject(forKey: "apply_status") as? Int
         city = aDecoder.decodeObject(forKey: "city") as? String
         cover = aDecoder.decodeObject(forKey: "cover") as? String
         createTime = aDecoder.decodeObject(forKey: "create_time") as? String
         endTime = aDecoder.decodeObject(forKey: "end_time") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         spot = aDecoder.decodeObject(forKey: "spot") as? String
         startTime = aDecoder.decodeObject(forKey: "start_time") as? String
         status = aDecoder.decodeObject(forKey: "status") as? Int
         title = aDecoder.decodeObject(forKey: "title") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if applyStatus != nil{
			aCoder.encode(applyStatus, forKey: "apply_status")
		}
		if city != nil{
			aCoder.encode(city, forKey: "city")
		}
		if cover != nil{
			aCoder.encode(cover, forKey: "cover")
		}
		if createTime != nil{
			aCoder.encode(createTime, forKey: "create_time")
		}
		if endTime != nil{
			aCoder.encode(endTime, forKey: "end_time")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if spot != nil{
			aCoder.encode(spot, forKey: "spot")
		}
		if startTime != nil{
			aCoder.encode(startTime, forKey: "start_time")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}

	}

}
