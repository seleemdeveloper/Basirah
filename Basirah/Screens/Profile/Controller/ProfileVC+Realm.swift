//
//  ProfileVC+Realm.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/19/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
extension ProfileVC
{
    
    func getCurrentUserName()->String
    {
        return currentUser()?.name ?? ""
    }
    
    func getCurrentUserEmail()->String
    {
        return currentUser()?.email ?? ""
    }
    
    func defaultLogout()
    {
        Defaults.set(key: DefaultsKeys.loggedUser.rawValue, for: "")
    }
    
}
