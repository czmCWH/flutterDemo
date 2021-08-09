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
        
        // 使用默认的 Dart 入口 lib/main.dart 文件里的 main() 函数。
//        self.flutterEngine.run(withEntrypoint: nil)
        
        // 使用指定的 Dart 入口
//        self.flutterEngine.run(withEntrypoint: "oneEntrypoint")
//        self.flutterEngine.run(withEntrypoint: "oneEntrypoint", libraryURI: "onePage.dart") 这样会报错找不到文件
        
        // 使用自定义的 Dart 入口，进行相关的开发
        self.flutterEngine.run(withEntrypoint: "navigatorEntrypoint")
        // 设置初始路由
//        self.flutterEngine.run(withEntrypoint: "navigatorEntrypoint", initialRoute: "/b")
        
        GeneratedPluginRegistrant.register(with: self.flutterEngine)
        
        return self.lifeCycleDelegate.application(application, didFinishLaunchingWithOptions: launchOptions ?? [:])
    }


}

extension AppDelegate: FlutterAppLifeCycleProvider {
    
    func add(_ delegate: FlutterApplicationLifeCycleDelegate) {
        
    }
    
    
}
