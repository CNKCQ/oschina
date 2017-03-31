//
//  UIViewController+Preparation.swift
//  OSCHINA
//
//  Created by KingCQ on 2017/3/31.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

private func swizzle(_ cls: UIViewController.Type) {
    [
        (#selector(cls.viewDidLoad), #selector(cls.os_viewDidLoad)),
        (#selector(cls.viewWillAppear(_:)), #selector(cls.os_viewWillAppear(_:)))
    ].forEach { original, swizzled in
        let originalMethod = class_getInstanceMethod(cls, original)
        let swizzledMethod = class_getInstanceMethod(cls, swizzled)
        let didAddswizzledMethod = class_addMethod(cls, original, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        if didAddswizzledMethod {
            class_replaceMethod(cls, swizzled, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
}

extension UIViewController {
    
    open override class func initialize() {
        guard self === UIViewController.self else { return }
        swizzle(self)
    }
    
    internal func os_viewDidLoad() {
        self.os_viewDidLoad()
        print("你好，\(#function)")
    }
    
    internal func os_viewWillAppear(_ animated: Bool) {
        self.os_viewWillAppear(animated)
        print("你好，\(#function)")
    }
}
