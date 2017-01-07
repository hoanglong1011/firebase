//
//  Cell.swift
//  AutoLayoutByCode
//
//  Created by Hoang Long on 12/17/16.
//  Copyright © 2016 Hoang Long. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    var lbl_Name:UILabel = {
        let lbl:UILabel = UILabel()
        lbl.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        lbl.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        self.addSubview(lbl_Name)
        
        lbl_Name.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        lbl_Name.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lbl_Name.leftAnchor.constraint(greaterThanOrEqualTo: self.leftAnchor, constant: 20).isActive = true
        lbl_Name.widthAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        lbl_Name.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        //lbl_Name.heightAnchor.constraint(greaterThanOrEqualTo: self.heightAnchor, constant: 1/2).isActive = true
        
        //self.bottomAnchor.constraint(equalTo: lbl_Name.bottomAnchor, constant: 20).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
