//
//  Copyright © 2016年 Jack. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper

class BaseViewModel {
    var provider: RxMoyaProvider<GankIOService>
    var page = 1
    var offset = 20
    var backgroundWorkScheduler: OperationQueueScheduler!

    init() {
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 3
        operationQueue.qualityOfService = QualityOfService.userInitiated
        backgroundWorkScheduler = OperationQueueScheduler(operationQueue: operationQueue)
        let networkActivityPlugin = NetworkActivityPlugin { change in
            switch change {
            case .ended:
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            case .began:
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
            }
        }

        provider = RxMoyaProvider<GankIOService>(plugins: [networkActivityPlugin, NetworkLoggerPlugin.init()])
        //        self.provider = RxMoyaProvider<GankIOService>() /// 不用Moya自带的log插件
    }

    //    func parseObject<T: Mappable>(response: Response) throws -> T {
    //        return try Mapper<T>().map(JSONString: response.mapString())!
    //    }
}
