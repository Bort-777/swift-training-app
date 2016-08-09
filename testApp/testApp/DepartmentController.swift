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
import MagicalRecord

class DepartmentController: BaseController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var department: [Department] = []
    let heightRow = CGFloat(56)

    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllDepartments()
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == Constant.sEditDepartment {
            let indexPaths = self.tableView!.indexPathsForSelectedRows
            let vc = segue.destinationViewController as! EditDepartmentViewController
            
            vc.departmentData = department[indexPaths!.first!.row]
        }
    }
    
    
    // MARK: - Data Request
    func fetchAllDepartments() {
        
        RequestManager.requestDepartaments(
            success: { result in
                for dataJSON in result {
                    Department.MR_importFromObject(dataJSON.dictionaryObject!)
                }
                self.reloadDepartments()
            },
            failed: {error in
                self.presentErrorAlertController(error)
        })
    }
    
    func reloadDepartments() {
        if let departmentNew = Department.MR_findAllSortedBy("name", ascending: true) as? [Department] {
            department.appendContentsOf(departmentNew)
        }
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension DepartmentController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return department.count
    }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(DepartmentCell.cellIdentifier, forIndexPath: indexPath) as! DepartmentCell
        cell.cellPosition = tableView.tableCellPosition(at: indexPath)
        cell.item = department[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate
extension DepartmentController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return heightRow
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
            self.performSegueWithIdentifier(Constant.sEditDepartment, sender: self)
    }
}
