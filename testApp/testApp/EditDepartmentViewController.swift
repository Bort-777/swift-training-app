//
//  EditDepartmentViewController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/5/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit
import MagicalRecord

class EditDepartmentViewController: BaseController {
    
    var departmentData: Department?
    let heightRow = CGFloat(56)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveAction(sender: AnyObject) {
        NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == Constant.sTaxes {
            
            let vc = segue.destinationViewController as! EditTaxInDepController
            vc.data = Array(departmentData!.taxes)
        }
    }
}

extension EditDepartmentViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return heightRow
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! EditDepartmentCell
        if let segue = cell.item!.menuSegue {
            self.performSegueWithIdentifier(segue, sender: self)
        }
    }
}

extension EditDepartmentViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return EditDepartment.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(EditDepartmentCell.cellIdentifier, forIndexPath: indexPath) as! EditDepartmentCell
        cell.delegate = self
        cell.item = EditDepartmentItem(index: indexPath.row, department: departmentData!)
        cell.cellPosition = tableView.tableCellPosition(at: indexPath)
        
        return cell
    }
}

extension EditDepartmentViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        departmentData?.name = textField.text!
        textField.resignFirstResponder()
        return true
    }
}

extension EditDepartmentViewController: EditDepartmentCellDelegate {
    func didChangeSwitchState(sender: EditDepartmentCell, isOn: Bool) {
        switch sender.item!.item {
        case .active:
            departmentData?.active = isOn
        default:
            break
        }
    }
    
    func didChangeTextField(sender: EditDepartmentCell, textData: String) {
        departmentData?.name = textData
    }
}