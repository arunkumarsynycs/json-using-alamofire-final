//
//  Constants.swift
//  json
//
//  Created by Arun Reddy on 10/06/19.
//  Copyright © 2019 ITS ME. All rights reserved.
//

import Foundation

class Constants{
    static var baseUrl = "https://rss.itunes.apple.com/api/v1/in/ios-apps/top-free/all/"
    
}
struct API {
    
    static var freeapps = Constants.baseUrl + "25/explicit.json"
}
