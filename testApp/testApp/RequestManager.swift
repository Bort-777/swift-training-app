//
//  Routing.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/4/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum RequestStatus: Int {
    case unauthorized = 401
    case found = 302
}

struct Answer {
    var status = RequestStatus.found
    var item: JSON?
}

class RequestManager {
    let headers: [String:String] = ["X-Access-Token1": Constant.kUserToken]
    var answer: Answer?
    
    func requestDepartaments() {
 
        let url = Constant.kApiUrl + Constant.kApiPrefix + Constant.kApiDepartments
        
        Alamofire.request(.GET, url, parameters: nil, headers: headers).responseJSON {
            _, _, result in
            if result.isFailure {
                
            }
            
            if let jsonObject: AnyObject = result.value {
                let json = JSON(jsonObject)
                if let jsonStatus = json["status"].int {
                    self.answer = Answer(status: RequestStatus(rawValue: jsonStatus)!, item: nil)
                }
                else {
                    self.answer = Answer(status: RequestStatus.found, item: json)
                }
            }
        }
    }
}