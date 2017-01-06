////
////  Copyright © 2016年 KingCQ. All rights reserved.
////  Created by KingCQ on 16/9/1.
////
//
//import Moya
//import ObjectMapper
//import RxSwift
//
//class BlogViewModel {
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
//    func fetch() -> Observable<[BlogObjList]?> {
////        return Observable.create({ observer -> Disposable in
////            self.provider.request(OSCIOService.BlogList) { response in
////                switch response {
////                case let .Success(response):
////                    let result = Mapper<BlogRootClass>().map(String(data: response.data, encoding:  NSUTF8StringEncoding))
////                    observer.on(Event.Next(result?.objList))
////                case let .Failure(error):
////                    observer.on(Event.Error(error))
////                }
////                observer.onCompleted()
////            }
////            return NopDisposable.instance
////        })
//        return Observable.create({ Observable -> Disposable in
//            
//        })
//    }
//}
