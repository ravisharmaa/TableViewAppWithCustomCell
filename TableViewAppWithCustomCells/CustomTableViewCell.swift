//
//  CustomTableViewCell.swift
//  TableViewAppWithCustomCells
//
//  Created by Ravi Bastola on 5/6/19.
//  Copyright © 2019 Ravi Bastola. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var dataImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var releaseDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setFields(result: Results) {
        self.dataImage.image = result.poster_path
        
        self.titleLabel.text = result.title
        
        self.releaseDate.text = result.release_date
        
    }
    
    

}
