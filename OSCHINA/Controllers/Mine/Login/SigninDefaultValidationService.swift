////
////  Copyright © 2016年 KingCQ. All rights reserved.
////  Created by KingCQ on 16/9/5.
////
//
//import Foundation
//import RxSwift
//import RxCocoa
//
//class SigninDefaultValidationService: SigninValidationService {
//    let API: SigninAPI
//    static let sharedValidationService = SigninDefaultValidationService(API: SigninDefaultAPI.sharedAPI)
//
//    init (API: SigninAPI) {
//        self.API = API
//    }
//
//    // validation
//
//    let minPasswordCount = 5
//
//    func validateUsername(_ username: String) -> Observable<ValidationResult> {
//        if username.characters.count == 0 {
//            return Observable.just(.Empty)
//        }
//
//        // this obviously won't be
////        if username.rangeOfCharacterFromSet(NSCharacterSet.alphanumericCharacterSet().invertedSet) != nil {
////            return Observable.just(.Failed(message: "Username can only contain numbers or digits"))
////        }
//
//        let loadingValue = ValidationResult.validating
//
//        return API
//            .usernameAvailable(username)
//            .map { available in
//                if available {
//                    return .ok(message: "Username available")
//                } else {
//                    return .failed(message: "Username already taken")
//                }
//            }
//            .startWith(loadingValue)
//    }
//
//    func validatePassword(_ password: String) -> ValidationResult {
//        let numberOfCharacters = password.characters.count
//        if numberOfCharacters == 0 {
//            return .empty
//        }
//
//        if numberOfCharacters < minPasswordCount {
//            return .failed(message: "Password must be at least \(minPasswordCount) characters")
//        }
//
//        return .ok(message: "Password acceptable")
//    }
//}
//
//class SigninDefaultAPI: SigninAPI {
//    let URLSession: Foundation.URLSession
//
//    static let sharedAPI = SigninDefaultAPI(
//        URLSession: Foundation.URLSession.shared
//    )
//
//    init(URLSession: Foundation.URLSession) {
//        self.URLSession = URLSession
//    }
//
//    func usernameAvailable(_ username: String) -> Observable<Bool> {
//        // this is ofc just mock, but good enough
//        let url = URL(string: "http://www.oschina.net/action/apiv2/login_validate\(username.URLEscaped)")!
//        let request = URLRequest(url: url)
//        return self.URLSession.rx_response(request)
//            .map { (maybeData, response) in
//                return response.statusCode == 404
//            }
//            .catchErrorJustReturn(false)
//    }
//
//    func signin(_ username: String, password: String) -> Observable<Bool> {
//        // this is also just a mock
//        let signinResult = arc4random() % 5 == 0 ? false : true
//        return Observable.just(signinResult)
//            .concat(Observable.never())
//            .throttle(0.4, scheduler: MainScheduler.instance)
//            .take(1)
//    }
//}