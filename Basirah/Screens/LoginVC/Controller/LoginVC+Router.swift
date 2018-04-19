//
//  LoginVC+Router.swift
//  Basirah
//
//  Created by Ahmed seleem on 4/16/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
import UIKit
extension LoginVC
{
    enum LoginRouterDestinations
    {
        case forgetPassword
        case registerUser
        case dashboard
    }
    
    func route(to destination: LoginRouterDestinations)
    {
        
        switch destination
        {
            case .forgetPassword: break
            case .registerUser:
                 let registerVC = RegisterVC(nibName: "RegisterVC", bundle: nil)
                 self.navigationController?.pushViewController(registerVC, animated: true)
        case .dashboard:
            
            guard let dashboardVC = UIStoryboard(name: "DashBoardVC", bundle: nil).instantiateViewController(withIdentifier: "DashBoardVC") as? DashboardVC else {return}
                self.present(dashboardVC, animated: true, completion: nil)
        }
    }
    
    
}
