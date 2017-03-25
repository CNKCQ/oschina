//
//	LoginRootClass.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class LoginRootClass: NSObject, NSCoding, Mappable {

    var code: Int?
    var user: User?

    class func newInstance(_ map: Map) -> Mappable? {
        return LoginRootClass()
    }

    required init?(_: Map) {
        super.init()
    }

    fileprivate override init() {}

    func mapping(map: Map) {
        code <- map["code"]
        user <- map["obj_data"]
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder) {
        code = aDecoder.decodeObject(forKey: "code") as? Int
        user = aDecoder.decodeObject(forKey: "obj_data") as? User
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder) {
        if code != nil {
            aCoder.encode(code, forKey: "code")
        }
        if user != nil {
            aCoder.encode(user, forKey: "obj_data")
        }
    }
}
