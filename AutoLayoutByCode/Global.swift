//
//  Global.swift
//  AutoLayoutByCode
//
//  Created by Hoang Long on 1/3/17.
//  Copyright © 2017 Hoang Long. All rights reserved.
//

import Foundation
import UIKit

func loadJson(API:API, method:Method, parameter:Dictionary<String, Any>? = nil, completion:@escaping (Any?)->()) {
    
    var link = API.fulllink
    
    if method == Method.GET {
        if parameter != nil {
            link += "?" + (parameter?.ToString())!
        }
    }
    
    let url:URL = URL(string: link)!
    
    var request = URLRequest(url: url)
    request.httpMethod = method.tostring
    
    if method == Method.POST {
        let boundary = generateBoundaryString()
        let body = NSMutableData()
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        for i in parameter! {
            if let image = i.value as? UIImage {
                let data = UIImageJPEGRepresentation(image, 0.5)
                let fname:String = "\(getTime()).jpeg"
                let mimetype = "image/png"
                body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                body.append("Content-Disposition:form-data; name=\"\(i.key)\"; FileName=\"\(fname)\"\r\n".data(using: String.Encoding.utf8)!)
                body.append("Content-Type: \(mimetype)\r\n\r\n".data(using: String.Encoding.utf8)!)
                body.append(data!)
                body.append("\r\n".data(using: String.Encoding.utf8)!)
                body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
            }
            else {
                //----------upload them param
                body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                body.append("Content-Disposition: form-data; name=\"\(i.key)\"\r\n\r\n".data(using: String.Encoding.utf8)!)
                body.append("\(i.value)\r\n".data(using: String.Encoding.utf8)!)
            }
        }
        
        //let data:Data = (parameter?.ToString().data(using: .utf8))!        
        
        request.httpBody = body as Data
    }
    
    let session = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if error == nil {
            do {
                let object =  try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                
                DispatchQueue.main.async {
                    completion(object)
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
        else {
            DispatchQueue.main.async {
                completion(nil)
            }
        }
    }
    
    session.resume()
}

func generateBoundaryString() -> String
{
    return "Boundary-\(NSUUID().uuidString)"
}

func getTime() -> String{
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    let minutes = calendar.component(.minute, from: date)
    let second = calendar.component(.second, from: date)
    let nano = calendar.component(.nanosecond, from: date)
    return "\(hour)-\(minutes)-\(second)-\(nano)"
}

func getDate()->String{
    let date = Date()
    let calendar = Calendar.current
    let day = calendar.component(.day, from: date)
    let month = calendar.component(.month, from: date)
    let year = calendar.component(.year, from: date)
    let hour = calendar.component(.hour, from: date)
    let minutes = calendar.component(.minute, from: date)
    return "\(day)/\(month)/\(year) \(hour):\(minutes)"
}
