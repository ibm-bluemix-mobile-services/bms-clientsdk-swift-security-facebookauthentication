//
//  AppDelegate.swift
//  FacebookMCA
//
//  Created by Asaf Manassen on 09/02/2016.
//  Copyright © 2016 Asaf Manassen. All rights reserved.
//


import UIKit
import FBSDKCoreKit
import BMSCore
import BMSSecurity
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private static let backendURL = "http://HackathonMCATeam.mybluemix.net"//"http://HackathonMCATeam.stage1.mybluemix.net"
    private static let backendGUID = "f8df6bbb-dca4-423b-8771-9c591451892a"//"57868f79-f78d-424f-9209-b016177c0949"
  //  private static let backendURL = "http://AsafsFacebookAuthApp.mybluemix.net" // your BM application URL
  //  private static let backendGUID = "9b3ce14a-e5f3-4d84-9a98-adae04dce53c" // the GUID you get from the dashboard
    public static let customResourceURL = "\(backendURL)/protectedResource" // any protected resource
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        
        BMSClient.sharedInstance.initializeWithBluemixAppRoute(AppDelegate.backendURL, bluemixAppGUID: AppDelegate.backendGUID, bluemixRegionSuffix: BMSClient.REGION_US_SOUTH)
        
        //setting default protocol so that wireshark can look at all of the messages
        BMSClient.defaultProtocol = BMSClient.HTTP_SCHEME
        
        let mcaAuthManager = MCAAuthorizationManager.sharedInstance
        mcaAuthManager.clearAuthorizationData()
        FacebookAuthenticationManager.sharedInstance.register()
        
        
        
        // Override point for customization after application launch.
        return FacebookAuthenticationManager.sharedInstance.application(application, didFinishLaunchingWithOptions: launchOptions)
        
    }
    func application(application: UIApplication,
        openURL url: NSURL,
        sourceApplication: String?,
        annotation: AnyObject) -> Bool {
        return FacebookAuthenticationManager.sharedInstance.application(application,openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

