//
//  Requests+Firebase.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/20/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
import Firebase

extension RequestsVC
{
 
    func getCurrentUserRequests(_ successHandler:@escaping (_ requestsWithoutResponse: [Request],_ requestsWitResponse: [Request])->(),_ failHandler: @escaping (_ msg: String)->())
  {
        ref = Database.database().reference()
        guard let userID = Auth.auth().currentUser?.uid else
        {
            failHandler("حدث خطأ في تحميل الطلبات")
            return
    
        }
    
    
    self.ref.child(RequestKeys.mainKey).child(userID).observeSingleEvent(of: .value)
    {
        
        (snapshot, str) in
        guard let requestsDict = snapshot.value as? [String:[String:AnyObject]] else
        {
            failHandler("لا توجد طلبات سابقة")
            return
        }
        
        var requests:[Request] = []
        var responses:[Request] = []
        for (requestTimestamp,requestDict) in requestsDict
        {
            let date = Date(timeIntervalSince1970: Double(requestTimestamp) ?? 0.0)
            guard let request = Request(JSON: requestDict) else
            {
                failHandler("حدث خطأ في تحميل الطلبات")
                return
            }
            request.bookDate = date.description
            request.requestOwner = userID
            request.requestTimestamp = requestTimestamp
            if request.response == nil
            {
             requests.append(request)
            }
            else
            {
              responses.append(request)
            }
        }
        successHandler(requests,responses)
    }
    
    
    
    
    }
    
}
