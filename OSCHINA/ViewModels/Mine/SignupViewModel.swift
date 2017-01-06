//
////  Copyright © 2016年 KingCQ. All rights reserved.
////  Created by KingCQ on 16/9/3.
////
//
//import UIKit
//import RxCocoa
//import RxSwift
//
//class SignupViewModel {
//
//    let validatedUsername: Observable<ValidationResult>
//    let validatedPassword: Observable<ValidationResult>
//    let validatedPasswordRepeated: Observable<ValidationResult>
//
//    // Is signup button enabled
//    let signupEnabled: Observable<Bool>
//
//    // Has user signed in
//    let signedIn: Observable<Bool>
//
//    // Is signing process in progress
//    let signingIn: Observable<Bool>
//
//
//    init(input: (
//        username: Observable<String>,
//        password: Observable<String>,
//        repeatedPassword: Observable<String>,
//        loginTaps: Observable<Void>
//        ),
//         dependency: (
//        API: SignupAPI,
//        validationService: SignupValidationService,
//        wireframe: Wireframe
//        )
//        ) {
//        let API = dependency.API
//        let validationService = dependency.validationService
////        let wireframe = dependency.wireframe
//
//        /**
//         Notice how no subscribe call is being made.
//         Everything is just a definition.
//
//         Pure transformation of input sequences to output sequences.
//         */
//
//        validatedUsername = input.username
//            .flatMapLatest { username in
//                return validationService.validateUsername(username)
//                    .observeOn(MainScheduler.instance)
//                    .catchErrorJustReturn(.Failed(message: "Error contacting server"))
//            }
//            .shareReplay(1)
//
//        validatedPassword = input.password
//            .map { password in
//                return validationService.validatePassword(password)
//            }
//            .shareReplay(1)
//
//        validatedPasswordRepeated = Observable.combineLatest(input.password, input.repeatedPassword, resultSelector: validationService.validateRepeatedPassword)
//            .shareReplay(1)
//
//        let signingIn = ActivityIndicator()
//        self.signingIn = signingIn.asObservable()
//
//        let usernameAndPassword = Observable.combineLatest(input.username, input.password) { ($0, $1) }
//
//        signedIn = input.loginTaps.withLatestFrom(usernameAndPassword)
//            .flatMapLatest { (username, password) in
//                return API.signup(username, password: password)
//                    .observeOn(MainScheduler.instance)
//                    .catchErrorJustReturn(false)
//                    .trackActivity(signingIn)
//            }
////            .flatMapLatest { loggedIn -> Observable<Bool> in
////                let message = loggedIn ? "Mock: Signed in to GitHub." : "Mock: Sign in to GitHub failed"
////                return wireframe.promptFor(message, cancelAction: "OK", actions: [])
////                    // propagate original value
////                    .map { _ in
////                        loggedIn
////                }
////            }
//            .shareReplay(1)
//
//        signupEnabled = Observable.combineLatest(
//            validatedUsername,
//            validatedPassword,
//            validatedPasswordRepeated,
//            signingIn.asObservable()
//        ) { username, password, repeatPassword, signingIn in
//            username.isValid &&
//                password.isValid &&
//                repeatPassword.isValid &&
//                !signingIn
//            }
//            .distinctUntilChanged()
//            .shareReplay(1)
//}
//}
