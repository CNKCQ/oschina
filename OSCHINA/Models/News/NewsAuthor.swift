//
//	NewsAuthor.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class NewsAuthor: NSObject, NSCoding, Mappable {

    var id: Int?
    var name: String?
    var portrait: String?

    required init?(_: Map) {
        super.init()
    }

    class func newInstance(map: Map) -> Mappable? {
        return NewsAuthor()
    }

    private override init() {}

    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        portrait <- map["portrait"]
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObject(forKey: "id") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        portrait = aDecoder.decodeObject(forKey: "portrait") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder) {
        if id != nil {
            aCoder.encode(id, forKey: "id")
        }
        if name != nil {
            aCoder.encode(name, forKey: "name")
        }
        if portrait != nil {
            aCoder.encode(portrait, forKey: "portrait")
        }
    }
}
