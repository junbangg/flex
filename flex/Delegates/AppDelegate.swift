//
//  AppDelegate.swift
//  flex
//
//  Created by Jun suk Bang on 2020/01/14.
//  Copyright © 2020 Jun Bang. All rights reserved.
//


import UIKit
import AWSS3
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
//    func application(_ application: UIApplication,
//      didFinishLaunchingWithOptions launchOptions:
//        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//      FirebaseApp.configure()
//      return true
//    }
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
    
    func initializeS3() {
        let poolID = "us-east-2:c58a7e24-f44d-4f2c-a2e0-8b3a0ed405fd"
        // Initialize the Amazon Cognito credentials provider

        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:.USEast2,
           identityPoolId: poolID)

        let configuration = AWSServiceConfiguration(region:.USEast2, credentialsProvider:credentialsProvider)

        AWSServiceManager.default().defaultServiceConfiguration = configuration
    }
    

}

