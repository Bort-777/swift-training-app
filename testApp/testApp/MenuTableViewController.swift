//
//  MenuTableViewController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/1/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class MenuTableViewController: UIViewController {
    
    private var menu = Menu()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MenuTableViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(MENU_ITEM, forIndexPath: indexPath) as! MenuTableViewCell
        
        cell.editData(title: menu.menuItem(index: indexPath.row))
        
        return cell
    }
}

extension MenuTableViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        
        switch row {
        case 2:
            self.performSegueWithIdentifier(STORE_SETUP, sender: self)
        default:
            break
        }
    }
}
