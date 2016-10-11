//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/9/3.
//

import RxSwift

enum ValidationResult {
    case OK(message: String)
    case Empty
    case Validating
    case Failed(message: String)
}

enum SignupState {
    case SignedUp(signedUp: Bool)
}

protocol SignupAPI {
    func usernameAvailable(username: String) -> Observable<Bool>
    func signup(username: String, password: String) -> Observable<Bool>
}

protocol SignupValidationService {
    func validateUsername(username: String) -> Observable<ValidationResult>
    func validatePassword(password: String) -> ValidationResult
    func validateRepeatedPassword(password: String, repeatedPassword: String) -> ValidationResult
}

extension ValidationResult {
    var isValid: Bool {
        switch self {
        case .OK:
            return true
        default:
            return false
        }
    }
}
