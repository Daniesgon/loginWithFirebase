//
//  ViewController.swift
//  loginWithFirebase
//
//  Created by Daniel Escandell González on 29/12/2020.
//  Copyright © 2020 Daniel Escandell González. All rights reserved.
//

import UIKit
import Firebase

class AuthenticationVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        errorLabel.alpha = 0
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        //Clean values
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let pass = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Check if all the fields are filled in
        if email.isEmpty || pass.isEmpty {
            
            //Show error, all the files must be filled in
            errorLabel.alpha = 1
            errorLabel.text = "Please, fill in all the fields"
            return
            
        }else {
            
            Auth.auth().signIn(withEmail: email, password: pass) { authResult, loginError in
                if loginError != nil {
                    
                    //Show error, all the files must be filled in
                    self.errorLabel.alpha = 1
                    let errorDescription = loginError?.localizedDescription
                    self.errorLabel.text = "\(errorDescription!)"
                    return
                    
                }else {
                    
                    self.performSegue(withIdentifier: "toHomeFromAuth", sender: self)
                    
                }
            }
        }
    } //End of loginButton method
    
    @IBAction func signupButton(_ sender: Any) {
        
        performSegue(withIdentifier: "toSignUpFromAuth", sender: self)
        
    }//End of signupButton method
    

}

