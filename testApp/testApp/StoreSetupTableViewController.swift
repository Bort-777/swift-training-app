//
//  StoreSetupTableViewController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/1/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class StoreSetupTableViewController: UIViewController {
    
    private var data = StoreSetupData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension StoreSetupTableViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(STORE_SETUP, forIndexPath: indexPath) as! StoreSetupTableViewCell
        let title = data.getItemName(indexPath.row)
        
        cell.mode = data.getItemType(title: title)
        cell.setTextData(labelText: title, sublineText: data.getItemSubtitle(title: title), imageName: data.getItemImage(title: title))
        
        return cell
    }
}