////
////  Copyright © 2016年 KingCQ. All rights reserved.
////  Created by KingCQ on 16/9/1.

import Moya
import RxSwift
import Alamofire

protocol NewsViewModelInputs {
    
}

protocol NewsViewModelOutputs {
    
    var banners: Observable<BannerRootClass> { set get }
    
    var newers: Observable<NewsRootClass> { set get }
}

protocol NewsViewModelType {
    
    var inputs: NewsViewModelInputs { get }
    
    var outputs: NewsViewModelOutputs { get }
}

class NewsViewModel: NewsViewModelType, NewsViewModelInputs, NewsViewModelOutputs {
    
    var newers: Observable<NewsRootClass>
    
    var banners: Observable<BannerRootClass>
    
    lazy var disposeBag = DisposeBag()
    var provider: MoyaProvider<OSCIOService>
    var backgroundScheduler: OperationQueueScheduler!
    var pageIndex = 0
    //    var pageSize = 2

    init() {
        let operationQueue = OperationQueue()
        backgroundScheduler = OperationQueueScheduler(operationQueue: operationQueue)
        provider = MoyaProvider<OSCIOService>()
        self.banners = Observable<BannerRootClass>.empty()
        self.newers = Observable<NewsRootClass>.just(NewsRootClass())
    }

    func setBanners() {
        banners = request(OSCIOService.newBanner)
    }
    
    func setNewers() {
        self.newers = request(OSCIOService.newBanner)
    }
    
    func banner() -> Observable<BannerRootClass> {
        return request(OSCIOService.newBanner)
    }

    func newsArr() -> Observable<[NewsObjList]> {
        return news().flatMap({ newRoot -> Observable<[NewsObjList]> in
            Variable(newRoot.objList!).asObservable()
        })
    }

    func news() -> Observable<NewsRootClass> {
        return request(OSCIOService.newsList(para: ["pageIndex": 0]))
    }

    func request<M: Codable>(_ token: OSCIOService) -> Observable<M> {
        return Observable.create({ observer -> Disposable in
            self.provider.request(token) { result in
                result.analysis(ifSuccess: { response in
                    let decoder = JSONDecoder()
                    do {
                        let entity: M = try decoder.decode(M.self, from: response.data)
                        print(entity)
                        observer.on(Event.next(entity))
                    } catch let error {
                        observer.on(Event.error(error))
                    }
                }, ifFailure: { error in
                    observer.on(Event.error(error))
                })
                observer.onCompleted()
            }

            return Disposables.create()
        })
    }
    
    var inputs: NewsViewModelInputs { return self }
    
    var outputs: NewsViewModelOutputs { return self }

}

// RxSwif 的使用场景 http://blog.csdn.net/lzyzsd/article/details/50120801
