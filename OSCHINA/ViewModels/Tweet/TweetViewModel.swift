////
////  TweetViewModel.swift
////  OSCHINA
////
////  Created by KingCQ on 16/9/1.
////  Copyright © 2016年 KingCQ. All rights reserved.
////
//
//import UIKit
//import RxSwift
//import ObjectMapper
//
//class TweetViewModel: NewsViewModel {
//    func fetch() -> Observable<[TweetObjList]?> {
//        return Observable.create({ observer -> Disposable in
//            self.provider.request(OSCIOService.TweetList) { response in
//                switch response {
//                case let .Success(response):
//                    let result = Mapper<TweetRootClass>().map(String(data: response.data, encoding:  NSUTF8StringEncoding))
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
