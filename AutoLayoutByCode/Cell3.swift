//
//  Cell3.swift
//  AutoLayoutByCode
//
//  Created by Hoang Long on 12/22/16.
//  Copyright © 2016 Hoang Long. All rights reserved.
//

import Foundation
import UIKit

class Cell3:BaseCollectionViewCell {
    
    var videos:Array<Video> = []
    
    lazy var col_Data:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let c:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        c.backgroundColor = UIColor.clear
        c.register(Cell4.self, forCellWithReuseIdentifier: "Cell4")
        
        c.translatesAutoresizingMaskIntoConstraints = false
        c.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        c.delegate = self
        c.dataSource = self
        
        return c
    }()
    
    func setupCollectionViewCell(){
        self.addSubview(col_Data)
        
        self.addConstraintWithVisualFormat(withVisualFormat: "V:|[v0]|", views: col_Data)
        self.addConstraintWithVisualFormat(withVisualFormat: "H:|[v0]|", views: col_Data)
    }
    
    override func setup() {
        self.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        setupCollectionViewCell()
    }
}

extension Cell3:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell4", for: indexPath) as! Cell4
        cell.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        cell.video_url = videos[indexPath.row].image
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Send event didSelectItemAt to ViewController
        let s:String = videos[indexPath.row].id
        NotificationCenter.default.post(name: NSNotification.Name.init("onClick"), object: s)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.size.height - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
