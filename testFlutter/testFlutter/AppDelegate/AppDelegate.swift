//
//  AppDelegate.swift
//  testFlutter
//
//  Created by czm on 2021/8/5.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var flutterEngine = FlutterEngine(name: "io.flutter", project: nil)
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
