//
//	BannerRootClass.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct BannerRootClass: Codable {

    var code: Int?
    var message: String?
    var result: ListModel?
    var time: String?

    enum CodingKeys: String, CodingKey {
        case code
        case message
        case result
        case time
    }

}

