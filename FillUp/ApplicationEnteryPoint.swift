//
//  LogInAndRegistrationPageViewControler.swift
//  FillUP
//
//  Created by Siavash Baratchi on 11/14/16.
//  Copyright © 2016 Siavash Baratchi. All rights reserved.
//

import UIKit

class ApplicationEnteryPointViewControler: UIViewController, GIDSignInUIDelegate {
    
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var enterButton: GIDSignInButton!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        //set the UI delegate of the GIDSignIn
        GIDSignIn.sharedInstance().uiDelegate = self
        
        GIDSignIn.sharedInstance().signInSilently()

        // If user is already signed in go to the main page
        if (GIDSignIn.sharedInstance().currentUser) != nil{
            self.performSegue(withIdentifier: "MainPageSegue", sender: self)
        }
         */
        registerButton.layer.borderWidth = 2
        registerButton.layer.borderColor = UIColor.orange.cgColor

    }
    
    @IBAction func GoToLogInPage(_ sender: UIButton) {
        self.performSegue(withIdentifier: "LogInPageSegue", sender: self)

    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

