//
//	NewsRootClass.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct NewsRootClass: Codable {

    var code: Int?
    var objList: [NewsObjList]?
    
    enum CodingKeys: String, CodingKey {
        case code
        case objList = "obj_list"
    }
    
//    func encode(to encode: Encoder) throws {
//        var container = encode.container(keyedBy: CodingKeys.self)
//        try container.encode(code, forKey: .code)
//        try container.encode(objList, forKey: .objList)
//    }
}
