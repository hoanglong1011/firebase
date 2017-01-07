//
//  BaseViewController.swift
//  AutoLayoutByCode
//
//  Created by Hoang Long on 1/3/17.
//  Copyright © 2017 Hoang Long. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    let image:UIImageView = {
        let img:UIImageView = UIImageView()        
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        setup()
    }
    
    func setup() {
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
