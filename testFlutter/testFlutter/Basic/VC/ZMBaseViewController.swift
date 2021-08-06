//
//  ZMBaseViewController.swift
//  testFlutter
//
//  Created by czm on 2021/8/5.
//

import UIKit

class ZMBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        self.view.backgroundColor = .white
        
        navigationController?.navigationBar.setBackgroundImage(nil, for: .any, barMetrics: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = .white
        
    }
    
    


}
