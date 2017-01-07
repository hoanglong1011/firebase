//
//  SecondViewController.swift
//  AutoLayoutByCode
//
//  Created by Hoang Long on 12/27/16.
//  Copyright © 2016 Hoang Long. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var video_id:String = ""
    var link:String {
        return "https://www.youtube.com/embed/\(video_id)"
    }
    
    let webview:UIWebView = {
        let w:UIWebView = UIWebView()
        
        w.translatesAutoresizingMaskIntoConstraints = false
        w.scrollView.isScrollEnabled = false
        
        return w
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        setupWebview()
        
        let url:URL = URL(string: link)!
        let request:URLRequest = URLRequest(url: url)
        webview.loadRequest(request)
    }
    
    func setupWebview(){
        self.view.addSubview(webview)
        
        view.addConstraintWithVisualFormat(withVisualFormat: "V:|-64-[v0]|", views: webview)
        view.addConstraintWithVisualFormat(withVisualFormat: "H:|[v0]|", views: webview)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
