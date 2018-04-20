//
//  UpdateRequestVC+Request.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/21/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
extension UpdateRequestVC
{
    
    func updateUI(request: Request)
    {
        self.bookNameTextField.text = request.bookName
        self.authorNameTextField.text = request.bookAuthor
        self.categoryTextField.text = request.bookCategory
        self.dueDateTextField.text = request.bookDueDate
    }
    
}
