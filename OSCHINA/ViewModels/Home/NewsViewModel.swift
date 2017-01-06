////
////  Copyright © 2016年 KingCQ. All rights reserved.
////  Created by KingCQ on 16/9/1.
////
//
//import Moya
//import ObjectMapper
//import RxSwift
//
//class NewsViewModel {
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
//    func fetch() -> Observable<[NewsItem]?> {
//        return Observable.create({ observer -> Disposable in
//            observer.onNext([])
//            return 
//        })
////        return Observable.create({ observer -> Disposable in
////            self.provider.request(OSCIOService.newsList) { response in
////                switch response {
////                case let .Success(response):
////                    do {
////
////                    }
////                    let result = Mapper<NewsRootClass>().map(String(data: response.data, encoding:  String.Encoding.utf8))
////                    observer.on(Event.Next(result?.result?.items))
////                case let .Failure(error):
////                    observer.on(Event.Error(error))
////                }
////                observer.onCompleted()
////            }
////            return Disposable.instance
////        })
//    }
//}
