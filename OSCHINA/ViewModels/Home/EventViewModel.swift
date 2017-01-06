////
////  Copyright © 2016年 KingCQ. All rights reserved.
////  Created by KingCQ on 16/9/1.
////
//
//import Moya
//import ObjectMapper
//import RxSwift
//
//class EventViewModel {
//    var provider: RxMoyaProvider<OSCIOService>
//    var backgroundScheduler: OperationQueueScheduler!
//    
//    
//    init() {
//        let operationQueue = OperationQueue()
//        backgroundScheduler = OperationQueueScheduler(operationQueue: operationQueue)
//        self.provider = RxMoyaProvider<OSCIOService>()
//    }
//    
//    func fetch() -> Observable<[EventObjList]?> {
//        return Observable.create({ observer -> Disposable in
//            self.provider.request(OSCIOService.eventList) { response in
//                switch response {
//                case let .Success(response):
//                    let result = Mapper<EventRootClass>().map(String(data: response.data, encoding:  String.Encoding.utf8))
//                    observer.on(Event.Next(result?.objList))
//                case let .Failure(error):
//                    observer.on(Event.Error(error))
//                }
//                observer.onCompleted()
//            }
//            return Disposable.instance
//        })
//    }
//}
