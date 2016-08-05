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
    
    var tableData: [Department] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        RequestManager.requestDepartaments(success, failed: failed)
    }
    
    func success(result: [JSON]) {
        for dataJSON in result {
            tableData.append(Department(json: dataJSON))
        }
        tableView.reloadData()
    }
    
    func failed(error: ErrorType) {
        var title: String = ""
        switch error {
        case .badResponse:
            title = "Try again"
        case .badReques:
            title = "Server is not available"
        case .badData:
            title = "Server is not available"
        }
        
        let alertController = UIAlertController(title: "Error", message:
            title, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Accept", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}

extension DepartmentController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableData.count
    }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(DepartmentCell.cellIdentifier, forIndexPath: indexPath) as! DepartmentCell
        cell.cellPosition = tableView.tableCellPosition(at: indexPath)
        cell.item = tableData[indexPath.row]
        return cell
    }
}
