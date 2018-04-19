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
    
    func login(email: String,password: String,successHandler: (_ user: User)->(),failureHandler: @escaping ()->())
    {
        
        Auth.auth().signIn(withEmail: email, password: password)
        {
            (user, error) in
            
            guard let user = user, error == nil else
            {
                failureHandler()
                return
            }
            
            
           
            
        }
        
    }
    
    
}
