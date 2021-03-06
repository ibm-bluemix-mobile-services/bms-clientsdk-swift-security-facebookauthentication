//
//  AppDelegate.swift
//  FacebookMCA
//
//  Created by Ilan Klein on 07/03/2016.
//  Copyright © 2016 ibm. All rights reserved.
//

import UIKit
import BMSCore
import BMSSecurity

//In order for the app to work you need to: 
//1. In this file : Fill your app details from bluemix (Url, GUID and region) and your protected resource path. 
//2. In info.plist file : Fill your facebook app id (two locations)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    fileprivate let tenantId = "{ENTER YOUR service tenantId (also referred in docs as appGUID)}"
    internal static let resourceURL = "{ENTER THE PATH TO YOUR PROTECTED RESOURCE (e.g. /protectedResource)" // any protected resource
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let mcaAuthManager = MCAAuthorizationManager.sharedInstance
        mcaAuthManager.initialize(tenantId: tenantId, bluemixRegion: "your region, choose from BMSClient.Region (usSouth, unitedKingdom, sydney) or add your own")
        BMSClient.sharedInstance.authorizationManager = mcaAuthManager
        
        FacebookAuthenticationManager.sharedInstance.register()
        // Override point for customization after application launch.
        return FacebookAuthenticationManager.sharedInstance.onFinishLaunching(application: application, withOptions:  launchOptions)
        
    }
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool{
           return FacebookAuthenticationManager.sharedInstance.onOpenURL(app, open: url, options: options)
    }


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

