//
//  RegisterVC+Router.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/19/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
import UIKit
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
                    guard let dashboardVC = UIStoryboard(name: "DashBoardVC", bundle: nil).instantiateViewController(withIdentifier: "DashBoardVC") as? DashboardVC else {return}
                    self.present(dashboardVC, animated: true, completion: nil)
        }
    }
    
    
}
