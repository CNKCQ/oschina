//
//  LoginController.swift
//  OSCHINA
//
//  Created by KingCQ on 16/9/2.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit
import Moya
import RxSwift

class SignupController: BaseViewController {
    var userField: UITextField!
    var pwdField: UITextField!
    var userLabel: UILabel!
    var pwdLabel: UILabel!
    var repeatedField: UITextField!
    var repeatedLabel: UILabel!
    var loginButton: UIButton!
    var indicatorView: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disposeBag = DisposeBag()
        title = "登录"
        userField = UITextField(frame: CGRect(x: 30, y: 120, width: view.bounds.width - 60, height: 38))
        userField.borderStyle = .roundedRect
        userLabel = UILabel(frame: CGRect(x: userField.frame.minX, y: userField.frame.maxY, width: userField.frame.width, height: 29))
        userLabel.text = "名字校验"
        pwdField = UITextField(frame: CGRect(x: userField.frame.minX, y: userLabel.frame.maxY + 10, width: userField.frame.width, height: userField.frame.height))
        pwdField.borderStyle = .roundedRect
        pwdLabel = UILabel(frame: CGRect(x: userField.frame.minX, y: pwdField.frame.maxY, width: userField.frame.width, height: 29))
        pwdLabel.text = "密码校验"
        repeatedField = UITextField(frame: CGRect(x: pwdLabel.frame.minX, y: pwdLabel.frame.maxY, width: pwdLabel.frame.width, height: 30))
        repeatedField.borderStyle = .roundedRect
        repeatedLabel = UILabel(frame: CGRect(x: repeatedField.frame.minX, y: repeatedField.frame.maxY, width: repeatedField.frame.width, height: 29))
        repeatedLabel.text = "重复校验"
        loginButton = UIButton(frame: CGRect(x: pwdField.frame.minX, y: repeatedLabel.frame.maxY + 10, width: pwdField.frame.width, height: 38))
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        loginButton.setTitle("登录", for: UIControlState())
        userField.text = "2280534011@qq.com"
        pwdField.text = "wcqvip"
        indicatorView = UIActivityIndicatorView()
        loginButton.addSubview(indicatorView)
        
        
        loginButton.layer.cornerRadius = 15
        loginButton.clipsToBounds = true
        loginButton.setBackgroundImage(UIImage.imageWithColor(UIColor.orange), for: UIControlState())
        loginButton.setBackgroundImage(UIImage.imageWithColor(UIColor.gray), for: .highlighted)
        
        view.addSubview(userField)
        view.addSubview(userLabel)
        view.addSubview(pwdField)
        view.addSubview(pwdLabel)
        view.addSubview(repeatedField)
        view.addSubview(repeatedLabel)
        view.addSubview(loginButton)
//        let viewModel = SignupViewModel(
//            input: (
//                username: userField.rx_text.asObservable(),
//                password: pwdField.rx_text.asObservable(),
//                repeatedPassword: repeatedField.rx_text.asObservable(),
//                loginTaps: loginButton.rx_tap.asObservable()
//            ),
//            dependency: (
//                API: SignupDefaultAPI.sharedAPI,
//                validationService: SignupDefaultValidationService.sharedValidationService,
//                wireframe: DefaultWireframe.sharedInstance
//            )
//        )
//        
//        viewModel.signupEnabled
//            .subscribeNext { [weak self] valid  in
//                self?.loginButton.enabled = valid
//                self?.loginButton.alpha = valid ? 1.0 : 0.5
//            }
//            .addDisposableTo(disposeBag)
//        
//        viewModel.validatedUsername
//            .bindTo(userLabel.ex_validationResult)
//            .addDisposableTo(disposeBag)
//        
//        viewModel.validatedPassword
//            .bindTo(pwdLabel.ex_validationResult)
//            .addDisposableTo(disposeBag)
//        
//        viewModel.validatedPasswordRepeated
//            .bindTo(repeatedLabel.ex_validationResult)
//            .addDisposableTo(disposeBag)
//        
//        viewModel.signingIn
//            .bindTo(indicatorView.rx_animating)
//            .addDisposableTo(disposeBag)
//        
//        viewModel.signedIn
//            .subscribeNext { signedIn in
//                print("User signed in \(signedIn)")
//            }
//            .addDisposableTo(disposeBag)
        //}
        
        let tapBackground = UITapGestureRecognizer()
//        tapBackground.rx_event
//            .subscribeNext { [weak self] _ in
//                self?.view.endEditing(true)
//            }
//            .addDisposableTo(disposeBag)
        view.addGestureRecognizer(tapBackground)
    }
    
    func login() {
//        let viewModel = LoginViewModel()
//        viewModel.login(userField.text!, pwd: pwdField.text!).subscribe(
//            onNext: { result in
////                log.info("\(result?.token)")
////                log.info("\(result?.name)")
//            }, onError: { error in
////                log.info("\(error)")
//            }, onCompleted: {
////                log.info("completed")
//            }, onDisposed: {
////                log.info("disposed")
//        }).addDisposableTo(self.disposeBag)
    }
    
    override func willMove(toParentViewController parent: UIViewController?) {
        if let parent = parent {
            assert(parent.isKind(of: UINavigationController.self), "Please read comments")
        } else {
            self.disposeBag = DisposeBag()
        }
    }
}
