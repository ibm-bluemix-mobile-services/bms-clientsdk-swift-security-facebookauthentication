//
//  FacebookAuthenticationManager.swift

//
//  Created by Asaf Manassen on 09/02/2016.
//  Copyright © 2016 Asaf Manassen. All rights reserved.
//

import Foundation
import BMSSecurity
import FBSDKLoginKit
public class FacebookAuthenticationManager :NSObject,AuthenticationDelegate{
    
    private static let FACEBOOK_REALM="wl_facebookRealm";
    private static let ACCESS_TOKEN_KEY="accessToken";
    private static let FACEBOOK_APP_ID_KEY="facebookAppId";
    let login:FBSDKLoginManager = FBSDKLoginManager()
    
    
    
    public static let sharedInstance:FacebookAuthenticationManager = FacebookAuthenticationManager()
    
    private override init() {
        super.init()
    }
    /**
     register for facebook realm in the authoraztion manager
     */
    public func register() {
        try! MCAAuthorizationManager.sharedInstance.registerAuthenticationDelegate(self, realm: FacebookAuthenticationManager.FACEBOOK_REALM) //register the delegate for facebook realm
    }
    
    
    public func onAuthenticationChallengeReceived(authContext : AuthenticationContext, challenge : AnyObject?) {
        //Make sure the user put Facebook appid in the plist
        guard NSBundle.mainBundle().infoDictionary?["FacebookAppID"] != nil else{
            authContext.submitAuthenticationFailure(["Error":"Please Put your facebook appid in your info.plist"])
            return
        }
        //make sure the challange appId is the same as plist appId
        guard let appID = challenge?[FacebookAuthenticationManager.FACEBOOK_APP_ID_KEY] as? String where appID == FBSDKLoginKit.FBSDKSettings.appID()
            else{
                authContext.submitAuthenticationFailure(["Error":"App Id from MCA server doesn't match the one defined in the .plist file"])
                return
        }
        
        //Facebook showing popup so it need to run on main thread
        dispatch_async(dispatch_get_main_queue(), {
            self.login.logInWithReadPermissions(["public_profile"], fromViewController: nil,
                handler: { (result:FBSDKLoginManagerLoginResult!, error:NSError!) -> Void in
                    guard error == nil else{
                        authContext.submitAuthenticationFailure(["Error":error])
                        return
                    }
                    
                    if result.isCancelled{
                        authContext.submitAuthenticationFailure(["Error":"The user canceled the operation"])
                    }
                    else{
                        let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                        authContext.submitAuthenticationChallengeAnswer([FacebookAuthenticationManager.ACCESS_TOKEN_KEY:accessToken])
                    }
                    
            })
        })
    }
    //MARK: Protocol implemantion

    public func onAuthenticationSuccess(info : AnyObject?) {
        print ("onAuthenticationSuccess info = \(info)")
    }
    
    public func onAuthenticationFailure(info : AnyObject?) {
        print ("onAuthenticationFailure info = \(info)")
    }
    
    //MARK: App Delegate code handler
    /******    needed by facebook you need to call those methods from your app delegate *******/
    
    
    public func onApplication(application: UIApplication,openURL url: NSURL,
        sourceApplication: String?,annotation: AnyObject) -> Bool {
            return FBSDKApplicationDelegate.sharedInstance().application(application,openURL: url,sourceApplication: sourceApplication,annotation: annotation)
    }
    
    public func onFinishLaunching(application: UIApplication, withOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
    }
    
}