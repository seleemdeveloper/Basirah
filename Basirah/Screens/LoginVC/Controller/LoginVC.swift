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
        route(to: .dashboard)
    }
    
    @IBAction func forgetPasswordButtonDidTouched(_ sender: UIButton)
    {
        route(to: .forgetPassword)
    }
    
}
