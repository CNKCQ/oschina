//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/9/5.
//

import RxSwift

enum SigninState {
    case signedIn(signedIn: Bool)
}

protocol SigninAPI {
    func usernameAvailable(_ username: String) -> Observable<Bool>
    func signin(_ username: String, password: String) -> Observable<Bool>
}

protocol SigninValidationService {
    func validateUsername(_ username: String) -> Observable<ValidationResult>
    func validatePassword(_ password: String) -> ValidationResult
}
