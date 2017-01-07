//
//  BaseCollectionViewCell.swift
//  AutoLayoutByCode
//
//  Created by Hoang Long on 12/22/16.
//  Copyright © 2016 Hoang Long. All rights reserved.
//

import Foundation
import UIKit

class BaseCollectionViewCell:UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    override func layoutSubviews() {
        setupLayoutSubViews()
    }
    
    func setup() {
    }
    
    func setupLayoutSubViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
