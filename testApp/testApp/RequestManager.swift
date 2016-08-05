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

enum ErrorType {
    case badReques, badResponse, badData
}

class RequestManager {
    static let headers: [String:String] = ["X-Access-Token": Constant.kUserToken]
    
    static func requestDepartaments(success: (answerJSONs: [JSON]) -> Void, failed: (ErrorType) -> Void) {
 
        let url = Constant.kApiUrl + Constant.kApiPrefix + Constant.kApiDepartments
        
        Alamofire.request(.GET, url, parameters: nil, headers: headers)
            .validate()
            .responseJSON {
            response in
            if response.result.isFailure {
                failed(ErrorType.badReques)
                return
            }
            
            if let jsonObject: AnyObject = response.result.value {
                let json = JSON(jsonObject)
                if let jsonArray = json.array {
                    success(answerJSONs: jsonArray)
                }
                else {
                    failed(ErrorType.badData)
                }
            }
            else {
                failed(ErrorType.badResponse)
            }
        }
    }
}
