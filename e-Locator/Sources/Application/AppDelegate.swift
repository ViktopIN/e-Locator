//
//  AppDelegate.swift
//  e-Locator
//
//  Created by Виктор on 17.03.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let viewcontroller = UINavigationController(rootViewController: MainViewController())
                
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewcontroller
        window?.makeKeyAndVisible()
        return true
    }
}
