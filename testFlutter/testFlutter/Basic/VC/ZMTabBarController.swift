//
//  ZMTabBarController.swift
//  testFlutter
//
//  Created by czm on 2021/8/5.
//

import UIKit

class ZMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().barTintColor = UIColor.white
        
        addChildViewController(HomeViewController(), "首页", "tabbar_home_")
        addChildViewController(OtherViewController(), "其它", "tabbar_extend_")
        addChildViewController(MineViewController(), "我的", "tabbar_mine_")
        
    }
    
    func addChildViewController(_ vc: UIViewController, _ title: String, _ imageName: String) {
        let navVc = ZMNavigationController(rootViewController: vc)
        addChild(navVc)
        
        navVc.tabBarItem.image = UIImage(named: imageName + "nor")?.withRenderingMode(.alwaysOriginal)
        navVc.tabBarItem.selectedImage = UIImage(named: imageName + "sel")?.withRenderingMode(.alwaysOriginal)
        navVc.tabBarItem.title = title
        let attriNor: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 11)]
        navVc.tabBarItem.setTitleTextAttributes(attriNor, for: .normal)
        navVc.tabBarItem.setTitleTextAttributes(attriNor, for: .reserved)
        let attriSel: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 11)]
        navVc.tabBarItem.setTitleTextAttributes(attriSel, for: .selected)
        navVc.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        navVc.tabBarItem.imageInsets = UIEdgeInsets(top: -1, left: 0, bottom: 1, right: 0)
    }
}
