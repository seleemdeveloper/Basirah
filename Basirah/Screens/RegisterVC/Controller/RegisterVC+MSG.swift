//
//  RegisterVC+MSG.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/19/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation

extension RegisterVC
{
    
    
    func showMSG(with msg: String)
    {
        self.msgIndicatorLabel.text = msg
        self.msgIndicatorLabel.isHidden = false
        
    }
    
    func hideMSG()
    {
        self.msgIndicatorLabel.isHidden = true
    }
    
}
