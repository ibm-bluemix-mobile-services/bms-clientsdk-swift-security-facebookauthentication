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

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static let backendURL = "https://AsafsFacebookAuthApp.mybluemix.net"
    static let backendGUID = "9b3ce14a-e5f3-4d84-9a98-adae04dce53c"
    static let protectedResourceURL = "/protectedResource" // any protected resource
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
    
        BMSClient.sharedInstance.initializeWithBluemixAppRoute(AppDelegate.backendURL, bluemixAppGUID: AppDelegate.backendGUID, bluemixRegion: BMSClient.REGION_US_SOUTH)
        
        FacebookAuthenticationManager.sharedInstance.register()
        
        let callBack:MfpCompletionHandler = {(response: Response?, error: NSError?) in
            var ans:String = "";
            if error == nil {
            ans="response:\(response?.responseText), no error"
        } else {
            ans="ERROR , error=\(error)"
            }
            print (ans)
        }
        
        print("URL =  \(AppDelegate.protectedResourceURL)")
        let request = Request(url: AppDelegate.protectedResourceURL, method: HttpMethod.GET)
        
//        request.sendWithCompletionHandler(callBack)
        
        MCAAuthorizationManager.sharedInstance.obtainAuthorization(callBack)
        return true
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
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FacebookAuthenticationManager.sharedInstance.onOpenURL(application, url: url, sourceApplication: sourceApplication, annotation: annotation)
    }
}

