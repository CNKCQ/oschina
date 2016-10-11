//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/9/5.
//

import RxSwift

enum SigninState {
    case SignedIn(signedIn: Bool)
}

protocol SigninAPI {
    func usernameAvailable(username: String) -> Observable<Bool>
    func signin(username: String, password: String) -> Observable<Bool>
}

protocol SigninValidationService {
    func validateUsername(username: String) -> Observable<ValidationResult>
    func validatePassword(password: String) -> ValidationResult
}
