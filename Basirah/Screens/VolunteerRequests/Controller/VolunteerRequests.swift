//
//  VolunteerRequests.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/21/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import UIKit
import Firebase


class VolunteerRequests: UIViewController {

    
    
    var ref: DatabaseReference!
    @IBOutlet weak var tableView: UITableView!
    
    var requests: [Request] = []
    {
        didSet
        {
            self.tableView.reloadData()
        }
    }
    
   
    
    private let refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshDidHappened(_:)), for: .valueChanged)
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getRequests()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    @objc private func refreshDidHappened(_ sender: Any)
    {
        getRequests()
    }
    
    
    func getRequests()
    {
       
        self.getAllRequests({ (requests) in
            self.requests = requests
            self.tableView.refreshControl?.endRefreshing()
            
        }) { (msg) in
            self.showDefaultAlert(title: "تحميل الطلبات", message: msg)
        }
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
