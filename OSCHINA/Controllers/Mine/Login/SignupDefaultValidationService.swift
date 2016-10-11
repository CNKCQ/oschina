//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/9/3.
//
import Foundation
import RxSwift
import RxCocoa

class SignupDefaultValidationService: SignupValidationService {
    let API: SignupAPI
    static let sharedValidationService = SignupDefaultValidationService(API: SignupDefaultAPI.sharedAPI)

    init (API: SignupAPI) {
        self.API = API
    }

    // validation
    let minPasswordCount = 5

    func validateUsername(username: String) -> Observable<ValidationResult> {
        if username.characters.count == 0 {
            return Observable.just(.Empty)
        }

        // this obviously won't be
        if username.rangeOfCharacterFromSet(NSCharacterSet.alphanumericCharacterSet().invertedSet) != nil {
            return Observable.just(.Failed(message: "Username can only contain numbers or digits"))
        }

        let loadingValue = ValidationResult.Validating

        return API
            .usernameAvailable(username)
            .map { available in
                if available {
                    return .OK(message: "Username available")
                } else {
                    return .Failed(message: "Username already taken")
                }
            }
            .startWith(loadingValue)
    }

    func validatePassword(password: String) -> ValidationResult {
        let numberOfCharacters = password.characters.count
        if numberOfCharacters == 0 {
            return .Empty
        }

        if numberOfCharacters < minPasswordCount {
            return .Failed(message: "Password must be at least \(minPasswordCount) characters")
        }

        return .OK(message: "Password acceptable")
    }

    func validateRepeatedPassword(password: String, repeatedPassword: String) -> ValidationResult {
        if repeatedPassword.characters.count == 0 {
            return .Empty
        }

        if repeatedPassword == password {
            return .OK(message: "Password repeated")
        } else {
            return .Failed(message: "Password different")
        }
    }
}


class SignupDefaultAPI: SignupAPI {
    let URLSession: NSURLSession

    static let sharedAPI = SignupDefaultAPI(
        URLSession: NSURLSession.sharedSession()
    )

    init(URLSession: NSURLSession) {
        self.URLSession = URLSession
    }

    func usernameAvailable(username: String) -> Observable<Bool> {
        // this is ofc just mock, but good enough
        let URL = NSURL(string: "https://github.com/\(username.URLEscaped)")!
        let request = NSURLRequest(URL: URL)
        return self.URLSession.rx_response(request)
            .map { (maybeData, response) in
                return response.statusCode == 404
            }
            .catchErrorJustReturn(false)
    }

    func signup(username: String, password: String) -> Observable<Bool> {
        // this is also just a mock
        let signupResult = arc4random() % 5 == 0 ? false : true
        return Observable.just(signupResult)
            .concat(Observable.never())
            .throttle(0.4, scheduler: MainScheduler.instance)
            .take(1)
    }
}
