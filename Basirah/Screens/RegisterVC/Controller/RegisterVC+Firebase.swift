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
    
    func register(email: String,password: String,successHandler: (_ user: User)->(),failureHandler: @escaping ()->())
    {
        
        Auth.auth().createUser(withEmail: email, password: password) {
        
            (user, error) in
            
            guard let user = user, error == nil else
            {
                failureHandler()
                return
            }
            
            guard let realm = AppDelegate.realm else
            {
                failureHandler()
                return
            }
            
            let realmUser = User()
            realmUser.email = email
            realmUser.userType = .requester
            realmUser.password = password
            
            do
            {
               try realm.write
               {
                realm.add(realmUser)
                Defaults.set(key: DefaultsKeys.loggedUser.rawValue, for: realmUser)
                }
            }
            catch
            {
              failureHandler()
            }
            
        }
        
    }
    
    
}
