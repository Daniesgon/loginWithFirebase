//
//  ViewController.swift
//  loginWithFirebase
//
//  Created by Daniel Escandell González on 29/12/2020.
//  Copyright © 2020 Daniel Escandell González. All rights reserved.
//

import UIKit

class AuthenticationVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabel.alpha = 0
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        performSegue(withIdentifier: "toHomeFromAuth", sender: self)
        
    }
    
    @IBAction func signupButton(_ sender: Any) {
        
        performSegue(withIdentifier: "toSignUpFromAuth", sender: self)
        
    }
    

}

