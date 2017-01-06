//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/9/1.
//

import Foundation
import ObjectMapper

class BaseModel<T: Mappable>:  Mappable{
    
    var code: Bool?
    var results: [T]?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(_ map: Map) {
        code   <-  map["error"]
        results <-  map["results"]
    }
    
}
