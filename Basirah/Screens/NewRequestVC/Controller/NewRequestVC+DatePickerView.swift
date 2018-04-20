//
//  NewRequestVC+DatePickerView.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/20/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
import UIKit
extension NewRequestVC
{
    @objc
    func datePickerViewDidChangeValue()
    {
        self.dueDateTextField.text = datePickerView.date.description
    }
    
}
