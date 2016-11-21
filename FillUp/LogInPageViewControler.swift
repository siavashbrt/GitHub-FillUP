//
//  LogInViewControler.swift
//  FillUP
//
//  Created by Siavash Baratchi on 11/17/16.
//  Copyright © 2016 Siavash Baratchi. All rights reserved.
//

import UIKit
import Firebase

class LogInPageViewControler: UIViewController, GIDSignInUIDelegate {
    
    @IBAction func DismissLogInViewControler(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func GoToMainPageFromLoginPage()
    {
        let isMain = Thread.isMainThread // is going to be false in the PF completion handler
        if(isMain)
        {
        self.performSegue(withIdentifier: "MainPageSegue", sender: self)
        }
    }
    
    @IBOutlet weak var GoogleSignInButton: GIDSignInButton!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            (UIApplication.shared.delegate as! AppDelegate).signInCallBack = GoToMainPageFromLoginPage

            GoogleSignInButton.style =  GIDSignInButtonStyle.wide
            
            //set the UI delegate of the GIDSignIn
            GIDSignIn.sharedInstance().uiDelegate = self
                    
            
    }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
}
