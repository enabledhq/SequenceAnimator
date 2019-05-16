//
//  AppDelegate.swift
//  Demo
//
//  Created by Simeon Saint-Saens on 16/5/19.
//  Copyright © 2019 Enabled. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()        
        window?.makeKeyAndVisible()
        
        return true
    }

}

