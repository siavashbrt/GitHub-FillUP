//
//  LogInViewControler.swift
//  FillUP
//
//  Created by Siavash Baratchi on 11/17/16.
//  Copyright © 2016 Siavash Baratchi. All rights reserved.
//

import UIKit
import Firebase

class LogInViewControler: UIViewController, GIDSignInUIDelegate {

    @IBAction func SignOutWasPressed(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
    }
    
    @IBAction func DismissLogInViewControler(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func GoToMainPage()
    {
        self.performSegue(withIdentifier: "MainPageSegue", sender: self)
    }
    
    @IBOutlet weak var GoogleSignInButton: GIDSignInButton!
    
        override func viewDidLoad() {
            super.viewDidLoad()
        
            GoogleSignInButton.style =  GIDSignInButtonStyle.wide
            
            //set the UI delegate of the GIDSignIn
            GIDSignIn.sharedInstance().uiDelegate = self
            
            //GIDSignIn.sharedInstance().signInSilently()
            
            // TODO(developer) Configure the sign-in button look/feel
            // ...
            
            (UIApplication.shared.delegate as! AppDelegate).signInCallBack = GoToMainPage
            
    }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
}
