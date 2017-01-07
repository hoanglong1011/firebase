//
//  Category.swift
//  AutoLayoutByCode
//
//  Created by Hoang Long on 12/27/16.
//  Copyright © 2016 Hoang Long. All rights reserved.
//

import Foundation
import UIKit

struct Category: BaseModel {
    var id:String
    var name:String
    var search:String
    var list:Array<Video>
    
    init(){
        self.id = ""
        self.name = ""
        self.search = ""
        self.list = Array<Video>()
    }
    
    init(object:Any){
        if let obj = object as? Dictionary<String,Any> {
            if let id = obj["id"] as? String {
                self.id = id
            }
            else { self.id = "" }
            
            if let title = obj["title"] as? String {
                self.name = title
            }
            else { self.name = "" }
            
            if let search = obj["search"] as? String {
                self.search = search
            }
            else { self.search = "" }
            
            if let arr = obj["list"] as? Array<Any> {
                list = Array<Video>()
                for i in 0..<arr.count {
                    let video = Video(object: arr[i])
                    self.list.append(video)
                }
            }
            else { self.list = Array<Video>() }
        }
        else {
            self.id = ""
            self.name = ""
            self.search = ""
            self.list = Array<Video>()
        }
    }
}
