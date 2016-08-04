//
//  StoreSetupTableViewController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/1/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class StoreSetupController: BaseController {
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDelegate
extension StoreSetupController : UITableViewDelegate {

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! StoreSetupCell
        if let segue = cell.item!.menuSegue {
            self.performSegueWithIdentifier(segue, sender: self)
        }
    }
}

// MARK: - UITableViewDataSource
extension StoreSetupController : UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StoreSetup.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(StoreSetupCell.cellIdentifier, forIndexPath: indexPath) as! StoreSetupCell
        cell.item = StoreSetupItem(index: indexPath.row)
        cell.cellPosition = tableView.tableCellPosition(at: indexPath)
        return cell
    }
}