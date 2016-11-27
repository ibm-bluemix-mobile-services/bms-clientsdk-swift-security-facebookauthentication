# iOS helloAuthentication Sample Application for Bluemix Mobile Services

The helloAuthentication sample contains a Swift project that you can use to learn more about the Mobile Client Access service.  

### Before you begin
Before you start, make sure you have:

- A [Bluemix](http://bluemix.net) account.
- A Bluemix app with the MCA service bound to it.

#### Configure the Mobile Client Access service

1.	In the Mobile Client Access dashboard, go to the **Authentication** tab to configure your authentication service.  
2.  Choose your authentication type to be Facebook.
3.  Enter the required configuration settings (APP ID for Facebook authentication).

>**Note:** If you have not previously created a Facebook mobile application, follow the instructions on how to [Register and Configure an App](https://developers.facebook.com/docs/apps/register#create-app).

### Configure the front end in the helloAuthentication sample
1. Open the `AppDelegate.swift` file. Change the values of the variables named: 'tenantId" and "resourceURL" to your app's values.
2. Enter your app's region as a parameter for BMSClient.sharedInstance.initialize

### Set up Facebook authentication

Copy the `FacebookAuthenticationManager.swift` file from the `BMSFacebookAuthentication` pod's source folder to your app's folder, and add it to the helloauthentication-swift project.

Update the `Info.plist` file with your Facebook App information:

- **FacebookAppID** (For example `1581349575427190`): You can get the App ID from the Facebook developer console.
- **FacebookDisplayName** (For example `helloAuth`): You can get App name from Facebook developer console.

Update URL Types, Item 0, URL Schemes, update Item 0 as follows:

- **URL Schemes**: (for example `fb1581349575427190` , fb+Client ID from Facebook developer console)
[Learn more about using Facebook as an identity provider](https://www.ng.bluemix.net/docs/#docs/services/mobileaccess/security/facebook/index.html)   

### Enable Keychain Sharing
When using Xcode 8.x, in order to use BMSFacebookAuthentication, you need to enable Keychain Sharing in your app. You can enable this feature in the Capabilities tab of your target.

### Run the iOS app
Now you can run the iOS application in your iOS emulator or on a physical device.


**Note:** Inside the **ViewController**, a GET request is made to a protected resource in the Node.js runtime on Bluemix. This code has been provided in the MobileFirst Services Starter boilerplate. The Node.js code provided in this boilerplate must be present in order for the sample to work as expected.


**Note:** This application runs on the latest version of XCode (V8.0). You might need to modify the application for Application Transport Security (ATS) changes made in iOS 9. For more information, see the following blog entry: [Connect Your iOS 9 App to Bluemix](https://developer.ibm.com/bluemix/2015/09/16/connect-your-ios-9-app-to-bluemix/).


### License
This package contains sample code provided in source code form. The samples are licensed under the Apache License, Version 2.0 (the "License"). You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 and may also view the license in the license.txt file within this package. Also see the notices.txt file within this package for additional notices.
