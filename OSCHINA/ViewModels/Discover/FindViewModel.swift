////
////  Copyright © 2016年 KingCQ. All rights reserved.
////  Created by KingCQ on 16/9/12.
////
//
//import UIKit
//import RxSwift
//import ObjectMapper
//
//class FindViewModel: NewsViewModel {
//    func search(_ name: String) -> Observable<[FindObjList]?> {
//        return Observable.create({ observer -> Disposable in
//            self.provider.request(OSCIOService.FindUser(name: name)) { response in
//                switch response {
//                case let .Success(response):
////                    do {
////                        let json = try response.mapJSON()
////                        print(json)
////                    } catch {
////                        print("失败了")
////                    }
//                    let result = Mapper<FindRootClass>().map(String(data: response.data, encoding:  NSUTF8StringEncoding))
//                    observer.on(Event.Next(result?.objList))
//                case let .Failure(error):
//                    observer.on(Event.Error(error))
//                }
//                observer.onCompleted()
//            }
//            return NopDisposable.instance
//        })
//    }
//}
