//
//  homeVC.swift
//  loginWithFirebase
//
//  Created by Daniel Escandell González on 29/12/2020.
//  Copyright © 2020 Daniel Escandell González. All rights reserved.
//

import UIKit
import Firebase

class homeVC: UIViewController {
    
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
            
            try firebaseAuth.signOut()
            performSegue(withIdentifier: "logout", sender: self)
            
        } catch let signOutError as NSError {
            
            print ("Error signing out: %@", signOutError)
            
        }
    }//End of logoutButton method
    

} //End of Class
