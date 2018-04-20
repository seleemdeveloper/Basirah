//
//  NewRequestVC.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/20/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import UIKit
import Firebase

class NewRequestVC: UIViewController {

    @IBOutlet weak var bookNameTextField: UITextField!
    @IBOutlet weak var authorNameTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var scrollView: UIScrollView!
    
 
    var ref: DatabaseReference!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerKeyboardNotifications()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        datePickerView.addTarget(self, action: #selector(datePickerViewDidChangeValue), for: .allEvents)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitButtonDidTouched(_ sender: UIButton)
    {
        let (valid,msg) = validateInputs(bookName: bookNameTextField.text ?? "", bookAuthor: authorNameTextField.text ?? "", category: categoryTextField.text ?? "", dueDate: dueDateTextField.text ?? "")
       if valid
       {
        addNewRequest(bookName:  bookNameTextField.text ?? "", bookAuthor: authorNameTextField.text ?? "", category: categoryTextField.text ?? "", dueDate: dueDateTextField.text ?? "", {
            
            self.dismiss(animated: true, completion: nil)
            
        }, { (msg) in
            
            self.showDefaultAlert(title: "لا يمكن ارسال الطلب", message: msg)
        })
       }
       else
       {
        self.showDefaultAlert(title: "لا يمكن ارسال الطلب", message: msg)
        }
        
    }
    @IBAction func categoryTextFieldDidTouched(_ sender: UIButton)
    {
        self.view.endEditing(true)
        self.pickerView.isHidden = false
        self.datePickerView.isHidden = true
    }
    
    @IBAction func dueDateTextFieldDidTouched(_ sender: UIButton)
    {
        self.view.endEditing(true)
        self.pickerView.isHidden = true
        self.datePickerView.isHidden = false
    }
    
    @IBAction func dismissButtonDidTouched(_ sender: UIButton)
    {
        self.dismiss(animated: true, completion: nil)
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
