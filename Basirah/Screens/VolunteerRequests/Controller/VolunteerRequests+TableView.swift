//
//  VolunteerRequests+TableView.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/20/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
import UIKit
extension VolunteerRequests: UITableViewDelegate,UITableViewDataSource
{
    struct CellIdentifier
    {
        static let RequestCell = "RequestCell"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       return requests.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.RequestCell, for: indexPath) as? RequestCell else {
                return UITableViewCell()
            }
            
            let req = requests[indexPath.row]
            cell.configureCell(name: req.bookName, author: req.bookAuthor, category: req.bookCategory, startDate: req.bookDate, endDate: req.bookDueDate)
            return cell
        
    
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
       
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 300
    }
    
    
    
    
    
}
