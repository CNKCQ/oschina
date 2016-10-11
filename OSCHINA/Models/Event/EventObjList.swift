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


	class func newInstance(map: Map) -> Mappable?{
		return EventObjList()
	}
    required init?(_ map: Map) {
        super.init()
    }

	private override init(){}

	func mapping(map: Map)
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
         applyStatus = aDecoder.decodeObjectForKey("apply_status") as? Int
         city = aDecoder.decodeObjectForKey("city") as? String
         cover = aDecoder.decodeObjectForKey("cover") as? String
         createTime = aDecoder.decodeObjectForKey("create_time") as? String
         endTime = aDecoder.decodeObjectForKey("end_time") as? String
         id = aDecoder.decodeObjectForKey("id") as? Int
         spot = aDecoder.decodeObjectForKey("spot") as? String
         startTime = aDecoder.decodeObjectForKey("start_time") as? String
         status = aDecoder.decodeObjectForKey("status") as? Int
         title = aDecoder.decodeObjectForKey("title") as? String
         url = aDecoder.decodeObjectForKey("url") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if applyStatus != nil{
			aCoder.encodeObject(applyStatus, forKey: "apply_status")
		}
		if city != nil{
			aCoder.encodeObject(city, forKey: "city")
		}
		if cover != nil{
			aCoder.encodeObject(cover, forKey: "cover")
		}
		if createTime != nil{
			aCoder.encodeObject(createTime, forKey: "create_time")
		}
		if endTime != nil{
			aCoder.encodeObject(endTime, forKey: "end_time")
		}
		if id != nil{
			aCoder.encodeObject(id, forKey: "id")
		}
		if spot != nil{
			aCoder.encodeObject(spot, forKey: "spot")
		}
		if startTime != nil{
			aCoder.encodeObject(startTime, forKey: "start_time")
		}
		if status != nil{
			aCoder.encodeObject(status, forKey: "status")
		}
		if title != nil{
			aCoder.encodeObject(title, forKey: "title")
		}
		if url != nil{
			aCoder.encodeObject(url, forKey: "url")
		}

	}

}