//
//  Third.swift
//  AutoLayoutByCode
//
//  Created by Hoang Long on 1/3/17.
//  Copyright © 2017 Hoang Long. All rights reserved.
//

import Foundation
import UIKit

class ThirdViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.setup()
        image.image = #imageLiteral(resourceName: "error")
        image.contentMode = .scaleAspectFit
        self.view.addSubview(image)
        
        self.view.addConstraintWithVisualFormat(withVisualFormat: "V:|[v0]|", views: image)
        self.view.addConstraintWithVisualFormat(withVisualFormat: "H:|[v0]|", views: image)
    }
}
