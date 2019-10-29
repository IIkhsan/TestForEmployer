//
//  AppDelegate.swift
//  TestForEmployer
//
//  Created by Ильяс Ихсанов on 25.10.2019.
//  Copyright © 2019 secret. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let devicesViewController = DevicesViewController()
        let navigationController = UINavigationController(rootViewController: devicesViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

}

