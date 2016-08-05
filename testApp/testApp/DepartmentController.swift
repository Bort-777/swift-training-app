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
    
    var departmentData: [Department] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        RequestManager.requestDepartaments(
            success: { result in
                for dataJSON in result {
                    self.departmentData.append(Department(json: dataJSON))
                }
                self.tableView.reloadData()
            },
            failed: {error in
                self.presentErrorAlertController(error)
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == Constant.sEditDepartment {
            let indexPaths = self.tableView!.indexPathsForSelectedRows
            let vc = segue.destinationViewController as! EditDepartmentViewController
            
            vc.departmentData = departmentData[indexPaths!.first!.row]
        }
    }
}

// MARK: - UITableViewDataSource
extension DepartmentController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return departmentData.count
    }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(DepartmentCell.cellIdentifier, forIndexPath: indexPath) as! DepartmentCell
        cell.cellPosition = tableView.tableCellPosition(at: indexPath)
        cell.item = departmentData[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate
extension DepartmentController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
            self.performSegueWithIdentifier(Constant.sEditDepartment, sender: self)
    }
}
