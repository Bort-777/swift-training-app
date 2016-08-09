//
//  TaxesController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/7/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MagicalRecord

class TaxesController: BaseController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var taxes: [Taxe] = []
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllTaxes()
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAllTaxes()
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == Constant.sEditDepartment {
//            let indexPaths = self.tableView!.indexPathsForSelectedRows
//            let vc = segue.destinationViewController as! EditDepartmentViewController
//            
//            vc.taxeData = taxes[indexPaths!.first!.row]
        }
    }
    
    // MARK: - Data Request
    func fetchAllTaxes() {
        
        RequestManager.requestTaxes(
            success: { result in
                for dataJSON in result {
                    Taxe.MR_importFromObject(dataJSON.dictionaryObject!)
                }
                self.reloadDepartments()
            },
            failed: {error in
                self.presentErrorAlertController(error)
        })
    }
    
    func reloadDepartments() {
        if let departmentNew = Taxe.MR_findAllSortedBy("name", ascending: true) as? [Taxe] {
            taxes.appendContentsOf(departmentNew)
        }
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension TaxesController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return taxes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(TaxesCell.cellIdentifier, forIndexPath: indexPath) as! TaxesCell
        cell.cellPosition = tableView.tableCellPosition(at: indexPath)
        cell.item = taxes[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate
extension TaxesController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //self.performSegueWithIdentifier(Constant.sEditDepartment, sender: self)
    }
}
