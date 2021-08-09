//
//  ZMFlutterViewController.swift
//  testFlutter
//
//  Created by czm on 2021/8/9.
//

import UIKit
import Flutter

class ZMFlutterViewController: FlutterViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
   

}
