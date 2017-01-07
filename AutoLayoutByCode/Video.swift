//
//  Video.swift
//  AutoLayoutByCode
//
//  Created by Hoang Long on 12/27/16.
//  Copyright © 2016 Hoang Long. All rights reserved.
//

import Foundation
import UIKit

struct Video: BaseModel {
    var id:String
    var name:String
    var search:String
    var image:String
    
    init(){
        self.id = ""
        self.name = ""
        self.search = ""
        self.image = ""
    }
    
    init(object:Any){
        if let obj = object as? Dictionary<String,Any> {
            if let id = obj["id"] as? String {
                self.id = id
            }
            else { self.id = "" }
            
            if let name = obj["name"] as? String {
                self.name = name
            }
            else { self.name = "" }
            
            if let search = obj["search"] as? String {
                self.search = search
            }
            else { self.search = "" }
            
            if let image = obj["image"] as? String {
                self.image = image
            }
            else { self.image = "" }
        }
        else
        {
            self.id = ""
            self.name = ""
            self.search = ""
            self.image = ""
        }
    }
}
