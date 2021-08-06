//
//  HomeViewController.swift
//  testFlutter
//
//  Created by czm on 2021/8/5.
//

import UIKit
import Flutter

class HomeViewController: ZMBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "首页"
        
        
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine {
            let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
//            self.present(flutterViewController, animated: true, completion: nil)
            flutterViewController.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(flutterViewController, animated: true)
        }
    }

}
