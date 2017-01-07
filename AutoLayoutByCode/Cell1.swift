//
//  Cell.swift
//  AutoLayoutByCode
//
//  Created by Hoang Long on 12/17/16.
//  Copyright © 2016 Hoang Long. All rights reserved.
//

import UIKit

class Cell1: BaseTableViewCell {
    
    var lbl_Name:UILabel = {
        let lbl:UILabel = UILabel()
        lbl.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    override func setup() {
        super.setup()
        
        self.addSubview(lbl_Name)
        
        lbl_Name.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        lbl_Name.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lbl_Name.leftAnchor.constraint(greaterThanOrEqualTo: self.leftAnchor, constant: 20).isActive = true
        lbl_Name.widthAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        lbl_Name.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
