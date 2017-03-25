////
////  Copyright © 2016年 KingCQ. All rights reserved.
////  Created by KingCQ on 16/9/3.
////
//
// import UIKit
// import RxCocoa
// import RxSwift
//
// class SigninViewModel {
//
//    let validatedUsername: Observable<ValidationResult>
//    let validatedPassword: Observable<ValidationResult>
//
//    // Is signup button enabled
//    let signinEnabled: Observable<Bool>
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
//        loginTaps: Observable<Void>
//        ),
//         dependency: (
//        API: SigninAPI,
//        validationService: SigninValidationService,
//        wireframe: Wireframe
//        )
//        ) {
//        let API = dependency.API
//        let validationService = dependency.validationService
//
//        /**
//         Notice how no subscribe call is being made.
//         Everything is just a definition.
//         Pure transformation of input sequences to output sequences.
//         */
//
//        validatedUsername = input.username
//            .flatMapLatest { username in
//                return validationService.validateUsername(username)
//                    .observeOn(MainScheduler.instance)
//                    .catchErrorJustReturn(.failed(message: "Error contacting server"))
//            }
//            .shareReplay(1)
//
//        validatedPassword = input.password
//            .map { password in
//                return validationService.validatePassword(password)
//            }
//            .shareReplay(1)
//
//        let signingIn = UIActivityIndicatorView()
//        self.signingIn = signingIn.asObservable()
//
//        let usernameAndPassword = Observable.combineLatest(input.username, input.password) { ($0, $1) }
//
//        signedIn = input.loginTaps.withLatestFrom(usernameAndPassword)
//            .flatMapLatest { (username, password) in
//                return API.signin(username, password: password)
//                    .observeOn(MainScheduler.instance)
//                    .catchErrorJustReturn(false)
//                    .trackActivity(signingIn)
//            }.shareReplay(1)
//
//        signinEnabled = Observable.combineLatest(
//            validatedUsername,
//            validatedPassword,
//            signingIn.asObservable()
//        ) { username, password, signingIn in
//            username.isValid &&
//                password.isValid &&
//                !signingIn
//            }
//            .distinctUntilChanged()
//            .shareReplay(1)
//    }
// }
