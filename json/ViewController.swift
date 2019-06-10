//
//  ViewController.swift
//  json
//
//  Created by Arun Reddy on 10/06/19.
//  Copyright © 2019 ITS ME. All rights reserved.
//

import UIKit
 var newsArray:[Results] = []
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCeoInfo()
        // Do any additional setup after loading the view.
        
    }
    
    func getCeoInfo(){
        
        Service.shared.GETService(extraParam: API.freeapps) { (response) -> (Void) in
            
           
            //print(response)
             let newsGet = response.dictionary
            if let allNews = newsGet!["feed"]!.dictionary{
                
                for get in (allNews["results"]?.array)!{
                    
                    var vaniNews = Results()
                    
                    vaniNews.artistName = get["artistName"].string!
                    vaniNews.id = get["id"].string!
                    vaniNews.kind = get["kind"].string!
                   
                    
                    newsArray.append(vaniNews)
                    
                    
                }
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
             
                print(newsArray)
                
            }
            
        }
    }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return newsArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell=tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
            cell.textLabel?.text=newsArray[indexPath.row].artistName
            return cell
        }
      }
class CustomCell:UITableViewCell{

}

