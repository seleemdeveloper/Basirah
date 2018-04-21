//
//  RegisterVC.swift
//  Basirah
//
//  Created by Ahmed seleem on 4/16/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    @IBOutlet weak var emailTextFiled: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    @IBOutlet weak var msgIndicatorLabel: UILabel!
    
    @IBOutlet weak var volunteerBox: GDCheckbox!
     @IBOutlet weak var requesterBox: GDCheckbox!
    
    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerKeyboardNotifications()
        
        emailTextFiled.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
    }

  
    @IBAction func signupButtonDidTouched(_ sender: UIButton)
    {
        register()
    }
    
    
    @IBAction func volunteerCheckBoxDidTouched(_ sender: GDCheckbox)
    {
        requesterBox.isOn = false
    }
    
    @IBAction func requesterBoxDidTouched(_ sender: GDCheckbox)
    {
        volunteerBox.isOn = false
    }
    
    
    func register()
    {
        guard let email = emailTextFiled.text,let password1 = passwordTextField.text,let password2 = repeatPasswordTextField.text else {
            return
        }
        validateInputs(email: email, password: password1, repeatedPassword: password2)
        {
            (isValid, msg) in
            
            let type = self.volunteerBox.isOn ? UserType.volunteer : UserType.requester
            if isValid
            {
                register(email: email, password: password1, type: type, successHandler:
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
