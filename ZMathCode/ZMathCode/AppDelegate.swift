//
//  AppDelegate.swift
//  ZMathCode
//
//  Created by zmfflying on 2020/6/23.
//  Copyright © 2020 zmfflying. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds);
        window?.backgroundColor = UIColor.white;
        let navigationController = UINavigationController.init(rootViewController: ViewController());
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default);
        navigationController.navigationBar.shadowImage = UIImage();
        navigationController.isNavigationBarHidden = true;
        window?.rootViewController = navigationController;
        window?.makeKeyAndVisible();
        return true
    }

}

