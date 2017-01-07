//
//  API.swift
//  AutoLayoutByCode
//
//  Created by Hoang Long on 1/3/17.
//  Copyright © 2017 Hoang Long. All rights reserved.
//

import Foundation
import UIKit

enum API:String {
    
    case data = "Data.json"
    case upload_image = "uploadImage.php"
    
    var fulllink:String {
        return "http://swift3.esy.es/\(self.rawValue)"
    }
}
