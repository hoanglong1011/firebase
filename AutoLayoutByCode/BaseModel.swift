//
//  BaseModel.swift
//  AutoLayoutByCode
//
//  Created by Hoang Long on 1/3/17.
//  Copyright © 2017 Hoang Long. All rights reserved.
//

import Foundation
import UIKit

protocol BaseModel {
    var id:String {get set}
    var name:String {get set}
    var search:String {get set}
    
    init()
    
    init(object:Any)    
}
