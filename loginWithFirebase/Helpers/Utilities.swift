//
//  utilitie.swift
//  loginWithFirebase
//
//  Created by Daniel Escandell González on 08/01/2021.
//  Copyright © 2021 Daniel Escandell González. All rights reserved.
//

import Foundation

class Utilities {

    //Checks if the password  is valid
    static func passwordValidator (_ password : String) -> Bool {
        
        /*
         
        ^                         Start anchor
        (?=.*[A-Z]                Ensure string has two uppercase letters.
        (?=.*[0-9])               Ensure string has two digits.
        (?=.*[a-z])               Ensure string has three lowercase letters.
        .{8,}                     Ensure string is of length 8.
        $                         End anchor.
         
        */
        let passRegex = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}$"
        let pass = NSPredicate(format: "SELF MATCHES %@", passRegex)
        return pass.evaluate(with: password)
        
    }
    
    //Checks if the email is valid
    static func isValidEmail(_ email: String) -> Bool {
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let email = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return email.evaluate(with: email)
        
    }
}
