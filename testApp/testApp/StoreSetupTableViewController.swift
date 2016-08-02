//
//  StoreSetupTableViewController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/1/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class StoreSetupTableViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension StoreSetupTableViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return StoreSetup.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constant.storeSetup, forIndexPath: indexPath) as! StoreSetupTableViewCell
        if let menuItem = StoreSetup(rawValue: indexPath.row) {
            cell.item = menuItem
        }
        
        return cell
    }
}