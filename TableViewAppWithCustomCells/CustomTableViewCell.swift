//
//  CustomTableViewCell.swift
//  TableViewAppWithCustomCells
//
//  Created by Ravi Bastola on 5/6/19.
//  Copyright © 2019 Ravi Bastola. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var testLabel: UILabel!
    
    @IBOutlet weak var dataImage: UIImageView!

    @IBOutlet weak var anotherLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setFields(result: Results) {
        //self.dataImage.image = result.poster_path
        print(result)
        self.testLabel.text = result.title
        
        self.anotherLabel.text = result.original_title
        
    }
    
    

}

extension UIImageView {

    func downloadImageFrom(url : URL) {
        
    }
}
