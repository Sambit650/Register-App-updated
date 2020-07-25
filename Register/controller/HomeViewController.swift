//
//  ViewController.swift
//  Register
//
//  Created by Sambit Das on 01/04/20.
//  Copyright © 2020 Sambit Das. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerButton.layer.cornerRadius = 10
        registrationButton.layer.cornerRadius = 10
    }


}

