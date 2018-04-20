//
//  ResponseCell.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/20/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import UIKit

class ResponseCell: UITableViewCell {

    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    
    @IBOutlet weak var replyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(name: String,author: String,category: String,startDate: String,endDate: String,voulnteerName: String)
    {
        self.bookNameLabel.text = name
        self.authorNameLabel.text = author
        self.categoryLabel.text = category
        self.startDateLabel.text = startDate
        self.endDateLabel.text = endDate
        
        self.replyLabel.text = "تم الرد بواسطة \(voulnteerName)"
    }


}
