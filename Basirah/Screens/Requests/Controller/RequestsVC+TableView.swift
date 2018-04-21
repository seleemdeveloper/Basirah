//
//  Requests+TableView.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/20/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
import UIKit
extension RequestsVC: UITableViewDelegate,UITableViewDataSource
{
    struct CellIdentifier
    {
        static let RequestCell = "RequestCell"
        static let ResponseCell = "ResponseCell"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        
        if let sectionView = Bundle.main.loadNibNamed("SectionView", owner: self, options: nil)![0] as? SectionView
        {
            if section == 0
            {
                sectionView.titleLabel.text = "الطلبات قيد الانتظار"
            }
            else
            {
                sectionView.titleLabel.text = "الطلبات المجابة"
            }
           return sectionView
        }
        
        return UIView()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0
        {
            return requestsWithoutResponses.count

        }
        else
        {
            return requestsWithResponses.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0
        {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.RequestCell, for: indexPath) as? RequestCell else {
                return UITableViewCell()
            }
            
            let req = requestsWithoutResponses[indexPath.row]
            cell.configureCell(name: req.bookName, author: req.bookAuthor, category: req.bookCategory, startDate: req.bookDate, endDate: req.bookDueDate)
            return cell
        }
        else
        {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.ResponseCell, for: indexPath) as? ResponseCell else {
                return UITableViewCell()
            }
            
            let req = requestsWithResponses[indexPath.row]
            if let response = req.response
            {
            cell.configureCell(name: req.bookName, author: req.bookAuthor, category: req.bookCategory, startDate: req.bookDate, endDate: req.bookDueDate, voulnteerName: response.volunteerName ?? "")

            }
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        /*
         let recorder = RecorderVC(nibName: "RecorderVC", bundle: nil)
         recorder.request = requests[indexPath.row]
         self.present(recorder, animated: true, completion: nil)
       */
        
        if indexPath.section == 0
        {
          route(to: .updateRequest(request: requestsWithoutResponses[indexPath.row]))
        }
        else
        {
         guard let response = requestsWithResponses[indexPath.row].response else{return}
          route(to: .player(url: response.url))
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0
        {
           return 300
        }
        else
        {
            return 330
        }
    }
    
    
    
    
    
}
