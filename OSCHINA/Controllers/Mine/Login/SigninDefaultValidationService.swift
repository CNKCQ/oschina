//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/9/5.
//

import Foundation
import RxSwift
import RxCocoa
import AwsomeTextField

class Sigin: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let phoneField = AwsomeTextField(frame: CGRect(x: 40, y: 140, width: SCREEN_WIDTH - 80, height: 44))
        phoneField.activeborderColor = .green
        phoneField.placeholder = "用户名"
        let pwdField = AwsomeTextField(frame: CGRect(x: phoneField.x, y: phoneField.frame.maxY + 15, width: phoneField.frame.width, height: phoneField.frame.height))
        pwdField.placeholder = "密     码"
        pwdField.activeborderColor = .green
        let button = UIButton(frame: CGRect(x: pwdField.x, y: pwdField.frame.maxY + 15, width: pwdField.frame.width, height: pwdField.frame.height))
        button.setTitle("登录", for: .normal)
        button.layer.borderColor = UIColor.green.cgColor
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1

        view.addSubview(phoneField)
        view.addSubview(pwdField)
        view.addSubview(button)
    }
}
