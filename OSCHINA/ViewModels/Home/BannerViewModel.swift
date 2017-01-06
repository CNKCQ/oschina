////
////  Copyright © 2016年 KingCQ. All rights reserved.
////  Created by KingCQ on 16/9/1.
////
//
//import Moya
//import ObjectMapper
//import RxSwift
//
//class BannerViewModel {
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
//    func fetchBanner() -> Observable<[BannerItem]?> {
////        return Observable.create({ observer -> Disposable in
////            self.provider.request(OSCIOService.newBanner) { response in
////                switch response {
////                case let .success(response):
////                    let result = Mapper<BannerRootClass>().map(String(data: response.data, encoding:  String.Encoding.utf8))
////                    observer.on(Event.Next(result?.result?.items))
////                case let .failure(error):
////                    observer.on(Event.error(error))
////                }
////                observer.onCompleted()
////            }
////            return Disposable.instance
////        })
//        return Observable.create({ observer -> Disposable in
//        })
//    }
//}
