//
//  RegisterVC.swift
//  Basirah
//
//  Created by Ahmed seleem on 4/16/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {
    @IBOutlet weak var emailTextFiled: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    @IBOutlet weak var msgIndicatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerKeyboardNotifications()
    }

  
    @IBAction func signupButtonDidTouched(_ sender: UIButton)
    {
        guard let email = emailTextFiled.text,let password1 = passwordTextField.text,let password2 = repeatPasswordTextField.text else {
            return
        }
        validateInputs(email: email, password: password1, repeatedPassword: password2)
        {
            (isValid, msg) in
            
            if isValid
            {
                register(email: email, password: password1, successHandler:
                {
                   self.route(to: .dashboard)
                }, failureHandler:
                {
                    msg in
                    self.showMSG(with: msg)
                })
            }
            else
            {
                showMSG(with: msg)
            }
        }
    }
    

    

}
