//
//  EditDepartmentViewController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/5/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class EditDepartmentViewController: BaseController {
    
    var departmentData: Department?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension EditDepartmentViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        _ = tableView.cellForRowAtIndexPath(indexPath) as! EditDepartmentCell
//        if let segue = cell.item!.menuSegue {
//            //self.performSegueWithIdentifier(segue, sender: self)
//        }
    }
}

extension EditDepartmentViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return EditDepartment.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(EditDepartmentCell.cellIdentifier, forIndexPath: indexPath) as! EditDepartmentCell
        cell.data = departmentData
        cell.item = EditDepartmentItem(index: indexPath.row)
        cell.cellPosition = tableView.tableCellPosition(at: indexPath)
        
        return cell
    }
}