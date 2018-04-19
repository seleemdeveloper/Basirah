//
//  Defaults.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/19/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation

enum DefaultsKeys: String
{
    case loggedUser = "loggedUser"
}

class Defaults
{
    
    class func set(key: String,`for` value: Any)
    {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func getValue(of key:String) -> Any?
    {
        return UserDefaults.standard.value(forKey: key)
    }
    
}
