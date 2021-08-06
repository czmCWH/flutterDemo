//
//  ZMNavigationController.swift
//  testFlutter
//
//  Created by czm on 2021/8/5.
//

import UIKit

class ZMNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    // 重写这两个方法
    open override var childForStatusBarHidden: UIViewController? {
        return self.topViewController
    }

    open override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }

}
