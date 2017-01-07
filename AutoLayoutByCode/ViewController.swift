//
//  ViewController.swift
//  AutoLayoutByCode
//
//  Created by Hoang Long on 12/17/16.
//  Copyright © 2016 Hoang Long. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isMenu:Bool = false
    var t2:CATransform3D!
    
    let arr:Array<String> = ["Menu", "I'm fine, What about you?", "Khoa", "Yes, of course. I have some interesting on my trip, I will tell you when I have free time", "OK, I'm so sorry, but it's time to go, see you late."]
    
    let viewtrang:UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    let viewDo:UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.7469059825, green: 0.1414546967, blue: 0.07516358048, alpha: 1)
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    lazy var tbl_Data:UITableView = {
        let t:UITableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.grouped)
        
        t.register(Cell.self, forCellReuseIdentifier: "Cell")
        t.register(Cell1.self, forCellReuseIdentifier: "Cell1")
        t.register(Cell2.self, forCellReuseIdentifier: "Cell2")
        
        t.translatesAutoresizingMaskIntoConstraints = false
        
        // Huỷ chiều cao mặc định của cell
        t.estimatedRowHeight = 100
        t.rowHeight = UITableViewAutomaticDimension
        
        t.delegate = self
        t.dataSource = self
        
        return t
    }()
    
    lazy var col_Data:UICollectionView = {
        let c:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        c.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        c.register(Cell3.self, forCellWithReuseIdentifier: "Cell3")
        c.contentInset.top = 10
        
        c.translatesAutoresizingMaskIntoConstraints = false
        
        c.delegate = self
        c.dataSource = self
        
        return c
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Receive event didSelectItemAt at Cell3
        NotificationCenter.default.addObserver(self, selector: #selector(didSelectCollectionViewCellInCell3), name: NSNotification.Name.init("onClick"), object: nil)
        
        self.view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        self.navigationItem.title = "Home"
        
        let left = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: self, action: #selector(ViewController.action))
        navigationItem.leftBarButtonItem = left
        
        //setupViewDo()
        setupTableView()
        setupViewTrang()
        setupGesture()
        setupCollectionView()
        
        loadData()
    }
    
    var playlists:Array<Category> = Array<Category>()
    func loadData(){
        // http://swift3.esy.es/Data.json
        
        // http://swift3.esy.es/uploadImage.php
        
        loadJson(API: API.upload_image, method: Method.POST, parameter: ["file":UIImage(named: "Khoa")!]) { (data) in
            if data != nil {
                print(data!)
                
                if let result = data as? Array<Any>
                {
                    for i in result {
                        let playlist:Category = Category(object: i)
                        self.playlists.append(playlist)
                    }
                    
                    self.col_Data.reloadData()
                }
                else {
                    self.present(ThirdViewController(), animated: true, completion: nil)
                }
            }
            else {
                self.present(ThirdViewController(), animated: true, completion: nil)
            }
        }
    }
    
    func didSelectCollectionViewCellInCell3(object:Notification){
        let second = SecondViewController()
        let link:String = object.object as! String
        
        second.video_id = link
        self.navigationController?.pushViewController(second, animated: true)
    }
    
    func setupViewTrang(){
        
        self.view.addSubview(viewtrang)
        
//        viewtrang.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
//        viewtrang.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
//        viewtrang.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
//        viewtrang.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
//        viewtrang.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
//        viewtrang.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
        
        //viewtrang.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/2).isActive = true
        view.addConstraintWithVisualFormat(withVisualFormat: "V:|[v0]|", views: viewtrang)
        view.addConstraintWithVisualFormat(withVisualFormat: "H:|[v0]|", views: viewtrang)
    }
    
    func setupViewDo(){
        
        self.view.addSubview(viewDo)
        
        viewtrang.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/2).isActive = true
        view.addConstraintWithVisualFormat(withVisualFormat: "V:|[v0][v1]|", views: viewtrang, viewDo)
        view.addConstraintWithVisualFormat(withVisualFormat: "H:|[v0]|", views: viewDo)
    }
    
    func setupTableView(){
        view.addSubview(tbl_Data)
        
        // 64 = Thanh pin + Navigation bar
        let width = (1.0 * UIScreen.main.bounds.width) / 3.0
        
        view.addConstraintWithVisualFormat(withVisualFormat: "V:|-64-[v0]|", views: tbl_Data)
        view.addConstraintWithVisualFormat(withVisualFormat: "H:|[v0]-\(width)-|", views: tbl_Data)
    }
    
    func setupCollectionView(){
        viewtrang.addSubview(col_Data)
        
        viewtrang.addConstraintWithVisualFormat(withVisualFormat: "V:|-64-[v0]|", views: col_Data)
        viewtrang.addConstraintWithVisualFormat(withVisualFormat: "H:|[v0]|", views: col_Data)
    }
    
    func setupGesture(){
        let right:UISwipeGestureRecognizer = UISwipeGestureRecognizer()
        right.direction = .left
        
        let left:UIScreenEdgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer()
        left.edges = .left
        
        viewtrang.addGestureRecognizer(right)
        viewtrang.addGestureRecognizer(left)
        
        right.addTarget(self, action: #selector(actionClose))
        left.addTarget(self, action: #selector(actionOpen))
    }
    
    func actionClose(_ sender:UISwipeGestureRecognizer){
        if sender.state == .ended { action() }
    }
    
    func actionOpen(_ sender:UIScreenEdgePanGestureRecognizer){
        if sender.state == .ended { action() }
    }
    
    func action(){
        
        let x = (2.0 * UIScreen.main.bounds.width) / 3.0
        
        if !isMenu {
            let t = CATransform3DTranslate(CATransform3DIdentity, x, 0, 0)
            
            UIView.animate(withDuration: 2, animations: {
                self.navigationController?.navigationBar.layer.transform = t
                self.viewtrang.layer.transform = t
            }) { (true) in
                //self.viewtrang.layer.transform = t
            }
        }
        else {
            UIView.animate(withDuration: 2, animations: {
                self.navigationController?.navigationBar.layer.transform = CATransform3DIdentity
                self.viewtrang.layer.transform = CATransform3DIdentity
            }) { (true) in
                //self.viewtrang.layer.transform = CATransform3DIdentity
            }
        }
        
        isMenu = !isMenu
    }
    
//    Change navigationbar position
//    override func viewDidAppear(_ animated: Bool) {
//        
//        navigationController?.navigationBar.frame.origin.x = 100
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 != 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! Cell2
            cell.pic.image = UIImage(named: "Khoa")
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! Cell1
            
            cell.lbl_Name.text = arr[indexPath.row]
            
            return cell
        }
    }
}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playlists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell3", for: indexPath) as! Cell3
        cell.videos = playlists[indexPath.row].list
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 20, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        
        cell.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 600, 600, 0)
        
        UIView.animate(withDuration: 3) {
            cell.alpha = 1
            cell.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, 0, 0)
        }
    }
}

