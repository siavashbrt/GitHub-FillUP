//
//  AppDelegate.swift
//  FillUp
//
//  Created by Siavash Baratchi on 11/6/16.
//  Copyright © 2016 Siavash Baratchi. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    var window: UIWindow?
    var signInCallBack: (()->())?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Use Firebase library to configure APIs [SIA]
        FIRApp.configure()

        // Conftigure Google Services
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        if(configureError != nil)
        {
            print("Error configuring Google services: \(configureError)")

        }
        
        // Initialize sign-in [SIA]
        GIDSignIn.sharedInstance().delegate = self
        //GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
    
        return true
        
    }
    
    // [SIA] The method should call the handleURL method of the GIDSignIn instance, 
    // which will properly handle the URL that your application receives at the end of the authentication process.
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url as URL!,
                                                    sourceApplication: sourceApplication,
                                                    annotation: annotation)
    }
    
    // [SIA]
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
       
        if(error != nil)
        {
            print("Looks like we got a sign-in error: \(error.localizedDescription)")
        }
        else
        {
            print("We are signed in! \(user)")
            /*
            let authentication = user.authentication
            let credential = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!,
                                                              accessToken: (authentication?.accessToken)!)
            FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            }*/
            signInCallBack!()

        }
    }
    
    // [SIA]
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user:GIDGoogleUser!,
                withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

