//
//  LoginVC+Firebase.swift
//  Basirah
//
//  Created by Ahmed seleem on 4/16/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
import Firebase
import RealmSwift

extension LoginVC
{
    
    func login(email: String,password: String,successHandler: @escaping ()->(),failureHandler: @escaping (_ msg: String)->())
    {
        
        Auth.auth().signIn(withEmail: email, password: password)
        {
            (user, error) in
            
            guard let _ = user, error == nil else
            {
                failureHandler("تعذر تسجيل الدخول تأكد من البريد الالكتروني وكلمة المرور ثم حاول مرة اخري")
                return
            }
            
            guard let realm = AppDelegate.realm else
            {
                failureHandler("تعذر تسجيل الدخول")
                return
            }
            
            let realmUser = User()
            realmUser.email = email
            realmUser.password = password
            
            do
            {
                if !isRegisteredEmail(email: email)
                {
                    try realm.write
                    {
                        realm.add(realmUser)
                    }
                }
                Defaults.set(key: DefaultsKeys.loggedUser.rawValue, for: realmUser.email)
                successHandler()
            }
            catch
            {
                failureHandler("تعذر تسجيل الدخول")
            }
            
        }
        
    }
            
            
    
    
    
}
