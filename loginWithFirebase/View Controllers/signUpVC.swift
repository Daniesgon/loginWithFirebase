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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func signinButton(_ sender: Any) {
        
        //Validate fields
        
        //Clean fiels results
        let name = nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastname = lastnameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let birthday = birthdayTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let pass  = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Create User
        Auth.auth().createUser(withEmail: email, password: pass) { (result, AUTHerror) in
            if AUTHerror != nil {
                //Show error while create user
            }
            else {
                //Save user's data
                let db = Firestore.firestore()
                db.collection("Users").addDocument(data: ["uid" : result!.user.uid, "Name" : name, "Lastname" : lastname, "Email" : email, "Birthday" : birthday]) { (DBerror) in
                    if DBerror != nil {
                        //Show error while create user
                        
                    }
                    else {
                        //Transition to Home
                        self.performSegue(withIdentifier: "toHomeFromSignUp", sender: self)
                    }
                }
            }
        }
        
    }
    

}
