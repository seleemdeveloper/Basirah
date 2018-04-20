//
//  RequestsVC.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/19/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import UIKit
import Firebase

class RequestsVC: UIViewController {

    

    var ref: DatabaseReference!
    @IBOutlet weak var tableView: UITableView!
    
    var requestsWithoutResponses: [Request] = []
    {
        didSet
        {
            self.tableView.reloadData()
        }
    }
    
    var requestsWithResponses: [Request] = []
    {
        didSet
        {
            self.tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.tableView.delegate = self
        self.tableView.dataSource = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.getCurrentUserRequests({ (requests,responses) in
            self.requestsWithoutResponses = requests
            self.requestsWithResponses = responses
        }) { (msg) in
            self.showDefaultAlert(title: "خطأ في تحميل الطلبات", message: msg)
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newRequestButtonDidTouched(_ sender: UIButton)
    {
        route(to: .newRequest)
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
