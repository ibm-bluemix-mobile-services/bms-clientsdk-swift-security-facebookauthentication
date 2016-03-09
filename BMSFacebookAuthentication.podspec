Pod::Spec.new do |s|
    s.name         = "BMSFacebookAuthentication"
    s.version      = '0.0.8'
    s.ios.deployment_target = '8.0'
    s.platform     = :ios, '8.0'
    s.requires_arc = true
    s.summary      = "Authentication manager for connecting to IBM Bluemix Mobile Services Facebook protected resource"
    s.homepage     = "https://github.com/ibm-bluemix-mobile-services/bms-clientsdk-swift-security-facebookauthentication"
    s.license      = 'Apache License, Version 2.0'
    s.author       = { "IBM Bluemix Services Mobile SDK" => "mobilsdk@us.ibm.com" }
    s.source       = { :git => 'https://github.com/ibm-bluemix-mobile-services/bms-clientsdk-swift-security-facebookauthentication.git', :tag => "v#{s.version}"}
    s.documentation_url = 'https://www.ng.bluemix.net/docs/#services/mobileaccess/index.html'

    s.dependency 'BMSSecurity'
    s.dependency 'FBSDKLoginKit', '~> 4.9'
    s.resource = 'Source/FacebookAuthenticationManager.swift'
end
