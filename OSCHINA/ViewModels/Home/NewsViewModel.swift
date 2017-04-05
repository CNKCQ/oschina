////
////  Copyright © 2016年 KingCQ. All rights reserved.
////  Created by KingCQ on 16/9/1.


import Moya
import ObjectMapper
import RxSwift
import Alamofire

class NewsViewModel {
    lazy var disposeBag = DisposeBag()
    var provider: RxMoyaProvider<OSCIOService>
    var backgroundScheduler: OperationQueueScheduler!
    var pageIndex = 0
    //    var pageSize = 2

    init() {
        let operationQueue = OperationQueue()
        backgroundScheduler = OperationQueueScheduler(operationQueue: operationQueue)
        self.provider = RxMoyaProvider<OSCIOService>()
    }

    func banner() -> Observable<BannerRootClass<BannerItem>> {
        return request(OSCIOService.newBanner)
    }

    func news() -> Observable<NewsRootClass> {
        return request(OSCIOService.newsList(para: ["pageIndex": 0]))
    }

    func request<M: Mappable>(_ token: OSCIOService) -> Observable<M> {
        return Observable.create({ observer -> Disposable in
            self.provider.request(token) { result in
                result.analysis(ifSuccess: { response in
                    guard let entity = Mapper<M>().map(JSONString: String(data: response.data, encoding: String.Encoding.utf8)!) else {
                        fatalError()
                    }
                    observer.on(Event.next(entity))
                }, ifFailure: { error in
                    observer.on(Event.error(error))
                })
                observer.onCompleted()
            }

            return Disposables.create()
        })
    }
}

// RxSwif 的使用场景 http://blog.csdn.net/lzyzsd/article/details/50120801
