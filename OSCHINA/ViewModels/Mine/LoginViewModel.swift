
//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/9/2.
//

import Foundation
import RxSwift
import RxCocoa
import ObjectMapper

class LoginViewModel: NewsViewModel {

    override init() {
        super.init()
    }

    func login(_ username: String, pwd: String) -> Observable<User?> {
        return Observable.create({ observer -> Disposable in
            self.provider.request(OSCIOService.Login(username: username, password: pwd)) { response in
                switch response {
                case let .Success(response):
                    let result = Mapper<LoginRootClass>().map(String(data: response.data, encoding:  NSUTF8StringEncoding))
                    observer.on(Event.Next(result?.user))
                case let .Failure(error):
                    observer.on(Event.Error(error))
                }
                observer.onCompleted()
            }
            return NopDisposable.instance
        })
    }
}
