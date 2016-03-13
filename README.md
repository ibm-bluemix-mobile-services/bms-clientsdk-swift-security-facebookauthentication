IBM Bluemix Mobile Services - Client SDK Swift Security -Facebook
===================================================

This is the Facebook security component of the Swift SDK for IBM Bluemix Mobile Services.

https://console.ng.bluemix.net/solutions/mobilefirst

## Requirements
* iOS 8.0+
* Xcode 7


## Installation
The Bluemix Mobile Services Facebook authentication Swift SDK is available via [Cocoapods](http://cocoapods.org/).
To install, add the `BMSFacebookAuthentication` pod to your `Podfile`.

##### iOS
```ruby
use_frameworks!

target 'MyApp' do
    platform :ios, '8.0'
    pod 'BMSFacebookAuthentication'
end
```

After doing so, the pod's sources will be added to your workspace. Copy the FacebookAuthenticationManager.swift file from the BMSFacebookAuthentication pod's source folder to you app folder.
Then find the info.plist file, usually located under "Supporting files" folder of your project. Add the following data to the source code of info.plist:

```
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>fb<your Facebook ID></string>
        </array>
    </dict>
</array>
<key>FacebookAppID</key>
<string><your Facebook ID></string>
<key>FacebookDisplayName</key>
<string><your FB app name> </string>
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>fbauth</string>
    <string>fbauth2</string>
</array>
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSExceptionDomains</key>
    <dict>
        <key>facebook.com</key>
        <dict>
            <key>NSIncludesSubdomains</key>
            <true/>                
            <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
            <false/>
        </dict>
        <key>fbcdn.net</key>
        <dict>
            <key>NSIncludesSubdomains</key>
            <true/>
            <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
            <false/>
        </dict>
        <key>akamaihd.net</key>
        <dict>
            <key>NSIncludesSubdomains</key>
            <true/>
            <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
            <false/>
        </dict>
    </dict>
</dict>
```

Note that there are three locations in the above segment which needs to be changed to your Facebook's app data.

** Make sure not to override any existing properties in the info.plist file. If you have overlapping properties you need to merge your file with the above segment manually.

## Getting started

In order to use the Bluemix Mobile Services Facebook Authentication Swift SDK, add the following imports in the class which you want to use it in:
```
import BMSCore
import BMSSecurity
import FBSDKLoginKit
```
Connectivity and interaction between your mobile app and the Bluemix services depends on the application ID and application route that are associated with Bluemix application.

The BMSClient API is the entry point for interacting with the SDK. You must invoke the
```
initializeWithBluemixAppRoute(bluemixAppRoute: String?, bluemixAppGUID: String?, bluemixRegion: String)
```
 method before any other API calls. </br>

 BMSClient provides information about the current SDK level and access to service SDKs. This method is usually in the application delegate of your mobile app.

An example of initializing the MobileFirst Platform for iOS SDK follows:

Initialize SDK with IBM Bluemix application route, ID and the region where your Bluemix application is hosted.
```
BMSClient.sharedInstance.initializeWithBluemixAppRoute(<app route>, bluemixAppGUID: <app guid>, bluemixRegion: BMSClient.<region>)
```

Then you have to register Facebook as your authentication manager Authentication Delegate to the MCAAuthorizationManager as follows:
```Swift
FacebookAuthenticationManager.sharedInstance.register()
```

Then add the following code to your app delegate:
```Swift
  func application(application: UIApplication,
        openURL url: NSURL,
        sourceApplication: String?,
        annotation: AnyObject) -> Bool {
        return FacebookAuthenticationManager.sharedInstance.onOpenURL(application, url: url, sourceApplication: sourceApplication, annotation: annotation)
    }

 ```  
=======================
Copyright 2015 IBM Corp.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
