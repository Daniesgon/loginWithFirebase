//
//  signUpVCViewController.swift
//  loginWithFirebase
//
//  Created by Daniel Escandell González on 29/12/2020.
//  Copyright © 2020 Daniel Escandell González. All rights reserved.
//

import UIKit

class signUpVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func signinButton(_ sender: Any) {
        
        performSegue(withIdentifier: "toHomeFromSignUp", sender: self)
        
    }
    

    
    // MARK: - Navigation


}
