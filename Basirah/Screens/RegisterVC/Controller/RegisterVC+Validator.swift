//
//  RegisterVC+Validator.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/19/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
extension RegisterVC
{
    
    func validateInputs(email:String,password:String,repeatedPassword:String,completion:(_ valid: Bool,_ msg: String)->())
    {
        
        guard !email.isEmpty,!password.isEmpty,!repeatedPassword.isEmpty else
        {
            completion(false, "املأ الخانات الفارغة")
            return
        }
        
        guard isValidEmail(email: email) else
        {
            completion(false, "ادخل البريد الالكتروني بشكل صحيح")
            return
        }
        
        guard passwordMatcing(password1: password, password2: repeatedPassword) else
        {
            completion(false, "تأكد من أن كلمتي المرور متطابقتين")
            return
        }
        
        completion(true, "")
    }
    
    
    func isValidEmail(email: String)->Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func passwordMatcing(password1:String,password2:String)->Bool
    {
        return password1 == password2
    }
    
}
