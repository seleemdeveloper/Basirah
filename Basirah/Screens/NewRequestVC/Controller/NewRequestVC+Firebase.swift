//
//  NewRequestVC+Firebase.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/20/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
import Firebase

extension NewRequestVC
{
    
    
    func addNewRequest(bookName: String,bookAuthor: String,category: String,dueDate: String,_ successHandler:()->(),_ failHandler: (_ msg: String)->())
    {
        ref = Database.database().reference()
        guard let userID = Auth.auth().currentUser?.uid else
        {
            failHandler("تعذر ارسال الطلب حاول مرة اخري")
            return
            
        }
        
        let requestBody:[String:String] = [
            RequestKeys.bookName : bookName,
            RequestKeys.bookAuthor : bookAuthor,
            RequestKeys.bookCategory : category,
            RequestKeys.date: Date().description,
            RequestKeys.dueDate : dueDate
        ]
        self.ref.child(RequestKeys.mainKey).child(userID).setValue(requestBody)
        
        
        successHandler()
        
        
    }
    
    
    
}
