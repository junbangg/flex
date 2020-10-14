//
//  SceneDelegate.swift
//  tst
//
//  Created by Jun suk Bang on 2020/01/16.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import UIKit
import SwiftUI
import SwiftKeychainWrapper

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        //        let accessToken: String? = KeychainWrapper.standard.string(forKey: "accessToken")
        //        //        var contentView : View
        //
        //        if accessToken != nil {
        //            //take user to rootviewController
        //            print("something in accessToken")
        //            //            let contentView = LogInViewController()
        //        }
        //        else {
        //            //            let contentView = RootViewController()
        //            print("nothing in accessToken")
        //        }
        
        // MARK: -Original Version
        
        // Create the SwiftUI view that provides the window contents.
        //        let obj = observed()
        //        //        let contentView = Profile()
        //        let contentView = SignIn()
        //        //token based rootview
        //        //        rootView: AppRootView()
        //
        //        // Use a UIHostingController as window root view controller.
        //
        //        if let windowScene = scene as? UIWindowScene {
        //            let window = UIWindow(windowScene: windowScene)
        //            window.rootViewController = UIHostingController(rootView: contentView.environmentObject(obj))
        //            self.window = window
        //            window.makeKeyAndVisible()
        //        }
        
        // MARK: Testing for MVVM
        
        guard let windowscene = scene as? UIWindowScene else {return}
        let obj = observed()
        let model = APINetworking()
        let viewModel = LoginViewModel(dataFetcher: model)
        let view = SignIn(viewModel: viewModel)
        
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: view.environmentObject(obj))
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}
// MARK: - This is used for token authentication
//struct AppRootView: View {
//    let accessToken: String? = KeychainWrapper.standard.string(forKey: "accessToken")
//
//    var body: some View {
//        Group {
//            if accessToken != nil {
//                //take user to rootviewController
//                //                print("something in accessToken")
//                RootViewController()
//            }
//            else {
//
//                //                print("nothing in accessToken")
//                SignIn()
//            }
//        }
//
//
//    }
//}



