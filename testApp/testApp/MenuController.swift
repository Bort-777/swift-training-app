//
//  MenuTableViewController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/1/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class MenuController: BaseController {

    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
//        configurationNavigationBar()
    }
    
    // MARK: - Actions
    @IBAction func logOutAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
}

// MARK: - UITableViewDataSource
extension MenuController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Menu.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(MenuCell.cellIdentifier, forIndexPath: indexPath) as! MenuCell
        cell.item = MenuItem(index: indexPath.row)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MenuController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! MenuCell
        if let segue = cell.item!.menuSegue {
            self.performSegueWithIdentifier(segue, sender: self)
        }
    }
}
