//
//  ProfileVC+Firebase.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/19/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
import Firebase

extension ProfileVC
{
    
    func updateUserInfo(name: String,_ successHandler:()->(),_ failHandler: (_ msg: String)->())
    {
    
        ref = Database.database().reference()
        guard let userID = Auth.auth().currentUser?.uid else
        {
            failHandler("تعذر تحديث البيانات الخاصة بك")
            return
            
        }
        guard let currentUser = currentUser() else
        {
            failHandler("تعذر تحديث البيانات الخاصة بك")
             return
        }
        
        guard let realm = AppDelegate.realm else
        {
            failHandler("تعذر تحديث البيانات الخاصة بك")
            return
        }
        
        let dict =
            [
                "name" : name,
                "type" : currentUser.type
            ]
        self.ref.child("users").child(userID).setValue(dict)
        
        
        try? realm.write
        {
            currentUser.name = name
        }

        successHandler()

       
    }
    
    
    
    
    
    
    func firebaseSignout()  throws
    {
        do
        {
            try Auth.auth().signOut()
        }
        catch let error
        {
            throw error
        }
    }
    
}
