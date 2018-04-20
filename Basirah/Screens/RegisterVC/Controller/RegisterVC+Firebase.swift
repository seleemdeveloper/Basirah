//
//  RegisterVC+Firebase.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/19/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
import Firebase
import RealmSwift

extension RegisterVC
{
    
    func register(email: String,password: String,successHandler: @escaping ()->(),failureHandler: @escaping (_ msg: String)->())
    {
        
        Auth.auth().createUser(withEmail: email, password: password) {
        
            (user, error) in
            
            guard let _ = user, error == nil else
            {
                failureHandler("تعذر تسجيل مستخدم جديد ربما يكون مسجل سابقا حاول مرة اخري")
                return
            }
            
            guard let realm = AppDelegate.realm else
            {
                failureHandler("تعذر تسجيل مستخدم جديد")
                return
            }
            
            
            let realmUser = User()
            realmUser.email = email
            realmUser.userType = .requester
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
                failureHandler("تعذر تسجيل مستخدم جديد")
            }
            
        }
        
    }
    
    
}
