//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/9/1.
//

import Moya
import ObjectMapper
import RxSwift

class EventViewModel {
    var provider: RxMoyaProvider<OSCIOService>
    var backgroundScheduler: OperationQueueScheduler!
    
    
    init() {
        let operationQueue = NSOperationQueue()
        backgroundScheduler = OperationQueueScheduler(operationQueue: operationQueue)
        self.provider = RxMoyaProvider<OSCIOService>()
    }
    
    func fetch() -> Observable<[EventObjList]?> {
        return Observable.create({ observer -> Disposable in
            self.provider.request(OSCIOService.EventList) { response in
                switch response {
                case let .Success(response):
                    let result = Mapper<EventRootClass>().map(String(data: response.data, encoding:  NSUTF8StringEncoding))
                    observer.on(Event.Next(result?.objList))
                case let .Failure(error):
                    observer.on(Event.Error(error))
                }
                observer.onCompleted()
            }
            return NopDisposable.instance
        })
    }
}
