//
//  UpdateRequestVC+Categories.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/20/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
import UIKit

extension UpdateRequestVC: UIPickerViewDelegate,UIPickerViewDataSource
{
    
    var categories:[String]
    {
       return  [
            "كتب علمية",
            "كتب دينية",
            "كتب أدبية",
            "لغات",
            "روايات عالمية",
            "مقالات علمية",
            "آوراق بحثية",
            "قصص خيالية",
            "قصص تاريخية",
            "روايات بوليسية",
            "قصص أطفال",
            "كتب تراثية",
            "مجلات وصحف",
            "أخري",
            ]
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryTextField.text = categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30.0
    }
    
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return self.view.bounds.width - 32.0
    }
    
    
    
}
