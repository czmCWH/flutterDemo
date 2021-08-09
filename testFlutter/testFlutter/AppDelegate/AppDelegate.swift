//
//  AppDelegate.swift
//  testFlutter
//
//  Created by czm on 2021/8/5.
//
/*
 
 FlutterEngine 充当 Dart VM 和 Flutter 运行时的主机；
 
 FlutterViewController 依附于 FlutterEngine，给 Flutter 传递 UIKit 的输入事件，并展示被 FlutterEngine 渲染的每一帧画面。
 
 让你的 app delegate 实现 FlutterAppLifeCycleProvider 协议，来确保 Flutter plugins 接收到必要的回调。
 
 */


import UIKit
import Flutter
import FlutterPluginRegistrant

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var flutterEngine = FlutterEngine(name: "my flutter engine", project: nil)
    lazy var lifeCycleDelegate = FlutterPluginAppLifeCycleDelegate()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = ZMTabBarController()
        window?.makeKeyAndVisible()
        
        self.flutterEngine.run(withEntrypoint: nil)
        GeneratedPluginRegistrant.register(with: self.flutterEngine)
        
        return self.lifeCycleDelegate.application(application, didFinishLaunchingWithOptions: launchOptions ?? [:])
    }


}

extension AppDelegate: FlutterAppLifeCycleProvider {
    
    func add(_ delegate: FlutterApplicationLifeCycleDelegate) {
        
    }
    
    
}
