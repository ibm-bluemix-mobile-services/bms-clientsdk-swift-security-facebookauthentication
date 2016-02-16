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
    /***
     IMPORTANT: Don't forget that for the app to work you must fill your facebook id in the plist
     and the following parameters
     ***/
    private static let backendURL = "{ENTER YOUR BACKANDURL}"
    private static let backendGUID = "{ENTER YOUR GUID}"
    public static let customResourceURL = "{ENTER THE PATH TO YOUR PROTECTED RESOURCE" // any protected resource
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //INIT
        BMSClient.sharedInstance.initializeWithBluemixAppRoute(AppDelegate.backendURL, bluemixAppGUID: AppDelegate.backendGUID, bluemixRegionSuffix: BMSClient.REGION_US_SOUTH)
        
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
    
    func applicationWillResignActive(application: UIApplication) {}
    
    func applicationDidEnterBackground(application: UIApplication) {}
    
    func applicationWillEnterForeground(application: UIApplication) {}
    
    func applicationDidBecomeActive(application: UIApplication) {}
    
    func applicationWillTerminate(application: UIApplication) {}
    
    
}

