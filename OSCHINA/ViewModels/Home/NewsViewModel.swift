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
    var provider: RxMoyaProvider<OSCIOService>
    var backgroundScheduler: OperationQueueScheduler!


    init() {
        let operationQueue = OperationQueue()
        backgroundScheduler = OperationQueueScheduler(operationQueue: operationQueue)
        self.provider = RxMoyaProvider<OSCIOService>()
    }

    func fetch() -> Observable<[NewsItem]?> {
        return Observable.create({ observer -> Disposable in
            self.provider.request(OSCIOService.newsList, completion: { result in
                result.analysis(ifSuccess: { response in
                    let entity = Mapper<NewsRootClass>().map(JSONString: String(data: response.data, encoding:  String.Encoding.utf8)!)
                    observer.on(Event.next(entity?.result?.items))
                }, ifFailure: { error in
                    observer.on(Event.error(error))
                })
                observer.onCompleted()
            })
//            let uri = "http://www.oschina.net/action/apiv2/news"
//            let request = URLRequest(url: URL(string: uri)!)
//            Alamofire.request(request).responseJSON(completionHandler: { response in
//                let result = Mapper<NewsRootClass>().map(JSONObject: response.result.value)
//                observer.on(Event.next(result?.result?.items))
//            })
            return Disposables.create()
        })
    }
}
