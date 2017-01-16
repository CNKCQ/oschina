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


    init() {
        let operationQueue = OperationQueue()
        backgroundScheduler = OperationQueueScheduler(operationQueue: operationQueue)
        self.provider = RxMoyaProvider<OSCIOService>()
    }
    
    func fetch() -> Observable<([NewsItem], [BannerItem])> {
        return Observable
            .zip(
                provider.request(OSCIOService.newsList).filter(statusCodes: 200...201).observeOn(backgroundScheduler).map({ response -> [NewsItem] in
                    if let result = Mapper<NewsRootClass>().map(JSONString: String(data: response.data, encoding:  String.Encoding.utf8)!) {
                        return (result.result?.items)!
                    } else {
//                        throw response as! Error
                        return []
                    }
                }),
                provider
                    .request(OSCIOService.newBanner)
                    .filter(statusCodes: 200...201)
                    .observeOn(backgroundScheduler)
                    .map({ response -> [BannerItem] in
                        if let result = Mapper<BannerRootClass>().map(JSONString: String(data: response.data,encoding:  String.Encoding.utf8)!){
                            return result.result!.items!
                        } else {
//                            throw response as! Error
                            return []
                        }
                    }),
                resultSelector: { news, banners -> ([NewsItem], [BannerItem]) in
                    return (news, banners)
            })
            .do(onNext:  { entities in
                print(entities)
            })
            .observeOn(MainScheduler.instance)
    }
}
