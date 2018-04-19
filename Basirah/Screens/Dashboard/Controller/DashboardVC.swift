//
//  DashboardVC.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/19/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import UIKit

class DashboardVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.selectedViewController = self.viewControllers?[1]

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
