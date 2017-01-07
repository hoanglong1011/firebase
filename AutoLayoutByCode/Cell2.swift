//
//  Cell.swift
//  AutoLayoutByCode
//
//  Created by Hoang Long on 12/17/16.
//  Copyright © 2016 Hoang Long. All rights reserved.
//

import UIKit

class Cell2: BaseTableViewCell {
    
    var pic:UIImageView = {
        let img:UIImageView = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    override func setup() {
        super.setup()
        
        self.addSubview(pic)
        
        pic.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        pic.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        pic.leftAnchor.constraint(greaterThanOrEqualTo: self.leftAnchor, constant: 20).isActive = true
        pic.heightAnchor.constraint(equalTo: pic.widthAnchor, multiplier: 1).isActive = true
        
        pic.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        pic.image = UIImage(named: "Khoa")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
