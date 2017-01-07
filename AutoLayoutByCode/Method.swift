//
//  Method.swift
//  AutoLayoutByCode
//
//  Created by Hoang Long on 1/3/17.
//  Copyright © 2017 Hoang Long. All rights reserved.
//

import Foundation
import UIKit

enum Method:String {
    case GET = "GET"
    case POST = "POST"
    
    var tostring:String {
        return self.rawValue
    }
}
