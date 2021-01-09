//
//  signUpVCViewController.swift
//  loginWithFirebase
//
//  Created by Daniel Escandell González on 29/12/2020.
//  Copyright © 2020 Daniel Escandell González. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class signUpVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabel.alpha = 0
        navigationItem.title = "Authentication"

    }
    @IBAction func signinButton(_ sender: Any) {
        
        //Clean fiels results
        let name = nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastname = lastnameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let birthday = birthdayTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let pass  = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let repeatPass = repeatPasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Check if all fields are filled in
        if name == "" || lastname == "" || email == "" || birthday == "" || pass == "" || repeatPass == "" {
            
            //Show error, all the files must be filled in
            errorLabel.alpha = 1
            errorLabel.text = "Please, fill in all the fields"
            return
            
        }else if pass != repeatPass {
            
            //Show error, password doesn't match
            errorLabel.alpha = 1
            errorLabel.text = "Please, check that password matches"
            return
            
        }else if !Utilities.passwordValidator(pass) {
            
            //Show error, password doesn't match
            errorLabel.alpha = 1
            errorLabel.text = "Password must have at least 8 characters, one capital letter and one number"
            return
            
        }/*else if !Utilities.isValidEmail(email) {
            
            //Show error, password doesn't match
            errorLabel.alpha = 1
            errorLabel.text = "This is not an email, please enter a valid email"
            return
            
        }*/else {
            
            //Create User
            Auth.auth().createUser(withEmail: email, password: pass) { (result, AUTHerror) in
                if AUTHerror != nil {
                    //Show error while create user
                    self.errorLabel.alpha = 1
                    let errorDescription = AUTHerror?.localizedDescription
                    self.errorLabel.text = "\(errorDescription!)"
                    return
                    
                }
                else {
                    
                    //Save user's data
                    let db = Firestore.firestore()
                    db.collection("Users").addDocument(data: ["uid" : result!.user.uid, "Name" : name, "Lastname" : lastname, "Email" : email, "Birthday" : birthday]) { (DBerror) in
                        if DBerror != nil {
                            //Show error while create user
                            self.errorLabel.alpha = 1
                            self.errorLabel.text = "Warning: user's info wasn't save propertly in the database"
                            return
                            
                        }
                        else {
                            
                            //Transition to Home
                            self.performSegue(withIdentifier: "toHomeFromSignUp", sender: self)
                            
                        }
                    }
                }
            }
        }
        
    } //End of the action signUpButton
    
}// End of the class
