//
//  NewRequestVC+Validator.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/20/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
extension NewRequestVC
{
    
    func validateInputs(bookName: String,bookAuthor: String,category: String,dueDate: String)->(valid: Bool,msg: String)
    {
        
        guard !bookName.isEmpty && !bookAuthor.isEmpty && !category.isEmpty && !dueDate.isEmpty else
        {
            return (false,"من فضلك املأ جميع الخانات")
        }
        return (true,"")
    }
    
    
}
