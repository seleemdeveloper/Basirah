//
//  ProfileVC+Router.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/20/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
import UIKit
extension ProfileVC
{
    enum ProfileRouterDestinations
    {
        case login
    }
    
    func route(to destination: ProfileRouterDestinations)
    {
        
        switch destination
        {
        case .login:
            let loginVC = LoginVC(nibName: "LoginVC", bundle: nil)
            let navigationVC = UINavigationController(rootViewController: loginVC)
            self.present(navigationVC, animated: true, completion: nil)
            
            
        }
    }
    
    
}
