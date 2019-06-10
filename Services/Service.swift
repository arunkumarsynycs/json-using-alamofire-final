//
//  Service.swift
//  json
//
//  Created by Arun Reddy on 10/06/19.
//  Copyright © 2019 ITS ME. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Service{
    
    static let shared = Service()
    
    init() {}
    
    func GETService(extraParam : String, onTaskCompleted : @escaping (JSON)->(Void) ) {
        
        print(extraParam)
        guard let url = URL(string: "\(extraParam)") else { return }
        
        Alamofire.request(url, method: .get,encoding:JSONEncoding.default, headers: nil).responseJSON
            { response in
                
                print(response)
                
                let jsonData = JSON(response.result.value as Any)
                onTaskCompleted(jsonData)
        }
    }
    
    
    func POSTService(serviceType : String,parameters : [String:String], onTaskCompleted : @escaping (JSON)->(Void)) {
        print(serviceType)
        guard let url = URL(string: "\(serviceType)") else { return }
        print(parameters)
        
        
        
        Alamofire.request(url, method: .post, parameters: parameters,headers: nil).responseJSON{ response in
            
            
            print(response)
            let jsonData = JSON(response.result.value as Any)
            onTaskCompleted(jsonData)
            
        }
    }
    
    func showValidationAlert(target : UIViewController, title : String, message : String, OntapOkButton : @escaping (() -> Void))  {
        
        
        
        let emailAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel) { (okayAction) in
            
            
            
            OntapOkButton()
            
            
            
        }
        
        emailAlert.addAction(okAction)
        
        DispatchQueue.main.async {
            
            target.present(emailAlert, animated: true, completion: nil)
            
        }
        
        
        
    }
}
