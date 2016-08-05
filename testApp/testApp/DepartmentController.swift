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
    
    func fetchAllDepartments() {
        
        if let departmentNew = Department.MR_findAll() as? [Department] {
            department.appendContentsOf(departmentNew)
        }
        tableView.reloadData()
        
//        RequestManager.requestDepartaments(
//            success: { result in
//                for dataJSON in result {
//                    let departmentE = Department.MR_createEntity()! as Department
//                    departmentE.initData(dataJSON)
//                    NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
//                }
//                self.tableView.reloadData()
//            },
//            failed: {error in
//                self.presentErrorAlertController(error)
//        })
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
            self.performSegueWithIdentifier(Constant.sEditDepartment, sender: self)
    }
}
