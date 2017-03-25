//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/9/1.
//

import Foundation
import ObjectMapper

class BaseModel<T: Mappable>: Mappable {

    var code: Bool?
    var results: [T]?

    required init?(_: Map) {}

    func mapping(map: Map) {
        code <- map["error"]
        results <- map["results"]
    }
}
