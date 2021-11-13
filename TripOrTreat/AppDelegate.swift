//
//  AppDelegate.swift
//  TripOrTreat
//
//  Created by 綸綸 on 2021/8/29.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        self.window?.frame = UIScreen.main.bounds
        
        // 設置顏色
        self.window!.backgroundColor = UIColor.clear
        
//        let tabController = Bundle.main.loadNibNamed("TabBarViewController", owner: nil, options: nil)?.first as? UITabBarController
//        
//        self.window?.rootViewController = tabController
        return true
    }
}

