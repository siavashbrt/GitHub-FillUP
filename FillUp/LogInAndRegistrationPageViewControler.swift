//
//  LogInAndRegistrationPageViewControler.swift
//  FillUP
//
//  Created by Siavash Baratchi on 11/14/16.
//  Copyright © 2016 Siavash Baratchi. All rights reserved.
//

import UIKit
import Firebase



class LogInAndRegistrationViewController: UIViewController, GIDSignInUIDelegate {
    
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var enterButton: GIDSignInButton!
 

    @IBAction func SignOutWasPressed(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set the UI delegate of the GIDSignIn
        GIDSignIn.sharedInstance().uiDelegate = self
        
        //GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...

        registerButton.layer.borderWidth = 2
        registerButton.layer.borderColor = UIColor.orange.cgColor

    }
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

