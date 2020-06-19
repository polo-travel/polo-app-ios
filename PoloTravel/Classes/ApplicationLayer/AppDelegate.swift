//
//  AppDelegate.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 08/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit
import Firebase
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
import Stripe

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        MSAppCenter.start("65c0cac3-ff40-4e65-bd64-6c4dbf0b3e16", withServices:[
          MSAnalytics.self,
          MSCrashes.self
        ])
        Stripe.setDefaultPublishableKey("pk_test_51Gv0hbBEWR4CpIJPnfms4SXHdMirBr7Qb30tybCb5ALM6gCemqMZaNKBy0h4xNtjAVT7JBlAojOFerVnt52Wglni00SHtn5eWJ")
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

