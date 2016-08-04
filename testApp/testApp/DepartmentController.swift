//
//  DepartmentController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/4/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DepartmentController: BaseController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var answer = Answer() {
        didSet {
            json = answer.item
            tableView.reloadData()
        }
    }
    
    var json: JSON?

    override func viewDidLoad() {
        super.viewDidLoad()
        //RequestManager().requestDepartaments()
        requestDepartaments()
    }
    
    func requestDepartaments() {
        let headers: [String:String] = ["X-Access-Token": Constant.kUserToken]
        
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

extension DepartmentController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = json?.arrayValue.count {
            return count
        }
        return 0
    }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(DepartmentCell.cellIdentifier, forIndexPath: indexPath) as! DepartmentCell
        cell.cellPosition = tableView.tableCellPosition(at: indexPath)
        return cell
    }
}
