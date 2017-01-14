//
//  BaseController.swift
//  OSCHINA
//
//  Created by KingCQ on 16/8/9.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxBlocking

class BaseViewController: BaseController {
    lazy var disposeBag = DisposeBag()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .black
        view.backgroundColor = UIColor.white
    }
    
}
