//
//  UIViewControllerExtension.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/20/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController
{
    func showTwoActionsAlert(title:String?,firstActiontitle:String?, secondActiontitle:String?,message:String?,firstAction: (()->Void)?, secondAction: (()->Void)?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let titleTxt = NSMutableAttributedString(string: title ?? "", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 15)])
        
        alertController.setValue(titleTxt, forKey: "attributedTitle")
        
        
        
        let firstAlertAction = UIAlertAction(title:firstActiontitle, style: .default) { (action) in
            firstAction?()
        }
        
        let secondAlertAction = UIAlertAction(title:secondActiontitle, style: .default) { (action) in
            secondAction?()
        }
        
        alertController.addAction(secondAlertAction)
        alertController.addAction(firstAlertAction)
        
        present(alertController, animated: true) {
        }
    }
    
    
    func showDefaultAlert(title:String?,message:String?, actionBlock:(()->Void)? = nil){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "حسنا", style: .cancel
        ) { (action) in
            alertController.dismiss(animated: true){
            }
            actionBlock?()
        }
        
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true) {
        }
    }
}
