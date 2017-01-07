//
//  ExtensionFuction.swift
//  AutoLayoutByCode
//
//  Created by Hoang Long on 12/17/16.
//  Copyright © 2016 Hoang Long. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addConstraintWithVisualFormat(withVisualFormat:String, views:UIView...){
        var v:Dictionary<String, Any> = Dictionary<String, Any>()
        
        for (index,view) in views.enumerated() {
            v["v\(index)"] = view
        }
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: withVisualFormat, options: NSLayoutFormatOptions(), metrics: nil, views: v))
    }
}

extension UIImageView {
    func loadImageOnline(link:String){
        let indicator:UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
        indicator.color = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(indicator)
        
        indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        indicator.startAnimating()
        
        let queue:DispatchQueue = DispatchQueue(label: "LoadImage")
        queue.async {
            let url:URL = URL(string: link)!
            
            do {
                let data:Data = try Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                    
                    indicator.stopAnimating()
                    indicator.hidesWhenStopped = true
                }
            }
            catch {}
        }
    }
}

extension Dictionary {
    
    func ToString() -> String{
        var s:String = ""
        
        for (index,value) in self.enumerated() {
            if index != self.count - 1 {
                s += "\(value.key)=\(value.value)&"
            }
            else {
                s += "\(value.key)=\(value.value)"
            }
        }
        
        return s
    }
}
