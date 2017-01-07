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

class BaseController: UIViewController {
    lazy var disposeBag = DisposeBag()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
    
    func startActivity(_ dest: UIViewController, animated: Bool = true) {
        dest.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(dest, animated: animated)
    }
}
