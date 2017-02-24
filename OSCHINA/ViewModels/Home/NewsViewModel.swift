////
////  Copyright © 2016年 KingCQ. All rights reserved.
////  Created by KingCQ on 16/9/1.
////
//
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
    
//    func refresh() -> Observable<([NewsObjList], [BannerItem])> {
//        let parameters = ["pageIndex": 0]
//        return fetch(parameters)
//    }
//    
//    func loadMore() -> Observable<([NewsObjList], [BannerItem])> {
//        pageIndex = pageIndex + 1
//        let parameters = ["pageIndex": pageIndex]
//        return fetch(parameters)
//    }
//
//    func fetch(_ parameters: [String: Int]) -> Observable<([NewsObjList], [BannerItem])> {
//        // 界面需要等到多个接口并发取完数据，再更新
//        return Observable
//            .zip(
//                provider.request(OSCIOService.newsList(para: parameters)).filter(statusCodes: 200...201).observeOn(backgroundScheduler).map({ response -> [NewsObjList] in
//                    if let result = Mapper<NewsRootClass>().map(JSONString: String(data: response.data, encoding:  String.Encoding.utf8)!) {
//                        return result.objList ?? []
//
//                    } else {
////                        throw response as! Error
//                        return []
//                    }
//                }),
//                provider
//                    .request(OSCIOService.newBanner)
//                    .filter(statusCodes: 200...201)
//                    .observeOn(backgroundScheduler)
//                    .map({ response -> [BannerItem] in
//                        if let result = Mapper<BannerRootClass>().map(JSONString: String(data: response.data,encoding:  String.Encoding.utf8)!){
//                            return result.result!.items!
//                        } else {
////                            throw response as! Error
//                            return []
//                        }
//                    }),
//                resultSelector: { news, banners -> ([NewsObjList], [BannerItem]) in
//                    return (news, banners)
//            })
//            .do(onNext:  { entities in
//                print(entities)
//            })
//            .observeOn(MainScheduler.instance)
//    }
    
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
                    guard let entity = Mapper<M>().map(JSONString: String(data: response.data, encoding:  String.Encoding.utf8)!) else {
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

