//
//  RegisterVC+Router.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/19/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
extension RegisterVC
{
    enum RegisterRouterDestinations
    {
        case dashboard
    }
    
    func route(to destination: RegisterRouterDestinations)
    {
        
        switch destination
        {
            case .dashboard:
                let dashboardVC = DashboardVC(nibName: "DashboardVC", bundle: nil)
                self.navigationController?.pushViewController(dashboardVC, animated: true)
            
        }
    }
    
    
}
