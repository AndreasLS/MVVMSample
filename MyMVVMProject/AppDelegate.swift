//
//  AppDelegate.swift
//  MyMVVMProject
//
//  Created by André Salla on 18/04/20.
//  Copyright © 2020 André Salla. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = MainViewController()
        self.window?.makeKeyAndVisible()
        
        return true
    }


}

