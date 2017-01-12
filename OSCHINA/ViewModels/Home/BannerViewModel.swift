//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/9/1.
//

import Moya
import ObjectMapper
import RxSwift

class BannerViewModel {
    var provider: RxMoyaProvider<OSCIOService>
    var backgroundScheduler: OperationQueueScheduler!


    init() {
        let operationQueue = OperationQueue()
        backgroundScheduler = OperationQueueScheduler(operationQueue: operationQueue)
        self.provider = RxMoyaProvider<OSCIOService>()
    }

    func fetchBanner() -> Observable<[BannerItem]?> {
        return Observable.create({ observer -> Disposable in
            self.provider.request(OSCIOService.newBanner) { result in
                result.analysis(ifSuccess: { response in
                    let entity = Mapper<BannerRootClass>().map(JSONString: String(data: response.data, encoding:  String.Encoding.utf8)!)
                    observer.on(Event.next(entity?.result?.items))
                }, ifFailure: { error in
                    observer.on(Event.error(error))
                })
                observer.onCompleted()
            }
            return Disposables.create()
        })
    }
}
