//
//  Utilities.swift
//  flex
//
//  Created by Jun suk Bang on 2020/02/15.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import Foundation

class Utilities {
    // MARK: - Name Validation
    static func isBlank(_ text : String?) -> Bool {
        return text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
    }
    // MARK: - Email Validation
    static func isValidEmail(_ email : String?) -> Bool {
        
        guard email != nil else { return false }
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }
    // MARK: - Password Validation
    static func isValidPassword(_ testStr : String?) -> Bool {
        guard testStr != nil else { return false }
        
        // at least one uppercase,
        // at least one digit
        // at least one lowercase
        // 8 characters total
        
        //        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        
        //special character version
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        
        return passwordTest.evaluate(with: testStr)
    }
    
    // MARK: - Check if passwords match
    static func matchPasswords(_ first : String?,_ second : String?) -> Bool {
        return first == second
    }
    
}
