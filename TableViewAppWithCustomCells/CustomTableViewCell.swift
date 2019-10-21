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
    
    var imageUrl: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setFields(result: Results) {
        
        guard let imageUrl = imageUrl, let url = URL(string: imageUrl+result.poster_path) else { return  }
        
        setImageFrom(url)
        
        self.testLabel.text = result.title
        
        self.anotherLabel.text = result.overview
        
    }
    
    fileprivate func setImageFrom(_ url: URL) {
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url)
            
            DispatchQueue.main.async {
                self.dataImage.image = UIImage(data: data!)
            }
        }
    }
    
}
