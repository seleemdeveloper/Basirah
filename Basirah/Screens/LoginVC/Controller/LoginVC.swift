//
//  LoginVC.swift
//  Basirah
//
//  Created by Ahmed seleem on 4/16/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var msgIndicatorLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerKeyboardNotifications()
        

    }

    @IBAction func createAccountButtonDidTouched(_ sender: UIButton)
    {
        route(to: .registerUser)
    }
    
    @IBAction func loginButtonDidTouched(_ sender: UIButton)
    {
        guard let email = emailTextField.text,let password = passwordTextField.text else {
            return
        }
        validateInputs(email: email, password: password)
        {
            (isValid, msg) in
            
            if isValid
            {
                login(email: email, password: password, successHandler:
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
    
    
    @IBAction func forgetPasswordButtonDidTouched(_ sender: UIButton)
    {
        route(to: .forgetPassword)
    }
    
}
