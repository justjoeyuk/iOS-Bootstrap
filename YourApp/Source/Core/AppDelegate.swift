//
//  AppDelegate.swift
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        setupInitialViewController()
        return true
    }
    
    private func setupInitialViewController() {
        let appFrame = UIScreen.mainScreen().bounds
        window = UIWindow(frame: appFrame)
        
        //let debugMode = DiskConfiguration.defaultConfig().settingForKey(.DebugMode)
        
        window?.rootViewController = UIViewController()
        window?.makeKeyAndVisible()
    }
    
}