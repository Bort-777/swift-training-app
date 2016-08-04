//
//  StoreSetupTableViewController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/1/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class StoreSetupController: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        configurationNavigationBar()
    }
    
//    override func viewDidAppear(animated: Bool) {
//        configurationNavigationBar()
//    }
}

extension StoreSetupController : UITableViewDelegate {

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 56
    }
}

extension StoreSetupController : UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StoreSetup.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(StoreSetupCell.cellIdentifier, forIndexPath: indexPath) as! StoreSetupCell
        cell.item = StoreSetupItem(index: indexPath.row)
        //cell.background = // extenstion UITableView
        return cell
    }
}