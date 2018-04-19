//
//  ProfileVC.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/19/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var msgIndicatorLabel: UILabel!

    
    var ref: DatabaseReference!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameTextField.text = getCurrentUserName()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.hideMSG()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.hideMSG()
        self.view.endEditing(true)
    }
    

    @IBAction func updateButtonDidTouched(_ sender: UIButton)
    {
        guard let name = nameTextField.text else { return }
        updateUserInfo(name: name, {
            self.showMSG(with: "تم تحديث معلوماتك بنجاح")
        })
        { (msg) in
            self.showMSG(with: msg)
        }
    }
    
    
    @IBAction func logoutButtonDidTouched(_ sender: UIButton)
    {
        self.showTwoActionsAlert(title: "تسجيل الخروج", firstActiontitle: "تأكيد", secondActiontitle: "الغاء", message: "هل أنت متأكد من انك تريد تسجيل الخروج", firstAction:
            {
                do
                {
                    try self.firebaseSignout()
                    self.defaultLogout()
                    self.route(to: .login)
                }
                catch
                {
                    self.showDefaultAlert(title: "فشل تسجيل الخروج", message: "يبدو ان هناك مشكلة حاول مرة اخري")
                }
            
        }, secondAction: nil)
        
    }
    

}
