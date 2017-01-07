//
//  Cell4.swift
//  AutoLayoutByCode
//
//  Created by Hoang Long on 12/22/16.
//  Copyright © 2016 Hoang Long. All rights reserved.
//

import Foundation
import UIKit

class Cell4:BaseCollectionViewCell {
    
    let image:UIImageView = {
        let img:UIImageView = UIImageView()
        img.image = #imageLiteral(resourceName: "Khoa")
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    let indicator:UIActivityIndicatorView = {
        let indicator:UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        indicator.color = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        return indicator
    }()
    
    var video_url:String = ""
    
    override func setup() {
        self.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        setupImageView()
    }
    
    override func setupLayoutSubViews(){
        image.loadImageOnline(link: video_url)
    }
    
    func setupImageView(){
        self.addSubview(image)
        
        self.addConstraintWithVisualFormat(withVisualFormat: "V:|[v0]|", views: image)
        self.addConstraintWithVisualFormat(withVisualFormat: "H:|[v0]|", views: image)
    }
}
