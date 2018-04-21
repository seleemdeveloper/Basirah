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
    
    func register(email: String,password: String,type:String,successHandler: @escaping ()->(),failureHandler: @escaping (_ msg: String)->())
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
                return
            }
            
            //=========================
            
            self.ref = Database.database().reference()
            guard let userID = Auth.auth().currentUser?.uid else
            {
                failureHandler("تعذر تحديث البيانات الخاصة بك")
                return
                
            }
           
            
            self.ref.child("users").child(userID).setValue(["type": type])
            
        }
        
    }
    
    
}
