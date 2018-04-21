//
//  RegisterVC+TextField.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/21/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
import UIKit

extension RegisterVC: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        register()
        return true
        
    }
    
}
