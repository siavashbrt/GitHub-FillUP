//
//  LogInAndRegistrationPageViewControler.swift
//  FillUP
//
//  Created by Siavash Baratchi on 11/14/16.
//  Copyright © 2016 Siavash Baratchi. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class LogInAndRegistrationViewController: UIViewController {
    
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerButton.layer.borderWidth = 2
        registerButton.layer.borderColor = UIColor.orange.cgColor

    }
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

