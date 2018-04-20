//
//  RequestsVC+Router.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/20/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
import UIKit
extension RequestsVC
{
    enum RequestsRouterDestinations
    {
        case newRequest
    }
    
    func route(to destination: RequestsRouterDestinations)
    {
        
        switch destination
        {
        case .newRequest:
            let newRequestVC = NewRequestVC(nibName: "NewRequestVC", bundle: nil)
            self.present(newRequestVC, animated: true, completion: nil)
            
            
        }
    }
    
    
}
